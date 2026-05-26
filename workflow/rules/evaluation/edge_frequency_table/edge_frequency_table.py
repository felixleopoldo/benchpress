import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib
import os
from pathlib import Path

matplotlib.use('Agg')
sns.set(rc={"figure.dpi": 300, 'savefig.dpi': 300})

output_dir = snakemake.params["output_dir"]
Path(output_dir).mkdir(parents=True, exist_ok=True)

edge = snakemake.params["edge"]
alg_conf_ids = snakemake.params["alg_conf_ids"]
sim_setup_labels = snakemake.params["sim_setup_labels"]
n_sim_setups = snakemake.params["n_sim_setups"]
n_alg_confs = len(alg_conf_ids)
blocks = snakemake.params["blocks"]  # length = n_sim_setups * n_alg_confs
graph_type = snakemake.params["graph_type"]
annot = snakemake.params["annot"]
annot_fontsize = snakemake.params["annot_fontsize"]
show_title = snakemake.params["show_title"]
show_cbar = snakemake.params["show_cbar"]
figsize = snakemake.params["figsize"]
fmt = snakemake.params["format"]
latex = snakemake.params["latex"]
latex_row_labels = snakemake.params["latex_row_labels"]

all_adjmat_files = list(snakemake.input["adjmats"])
true_adjmat_files = list(snakemake.input["true_adjmats"])

node1, node2 = edge
edge_str = f"{node1}_{node2}"

# Build raw proportion table: shape (n_sim_setups, n_alg_confs)
table = np.zeros((n_sim_setups, n_alg_confs))
file_offset = 0

for s in range(n_sim_setups):
    for c in range(n_alg_confs):
        cell_idx = s * n_alg_confs + c
        n_files = blocks[cell_idx]
        cell_files = all_adjmat_files[file_offset:file_offset + n_files]
        file_offset += n_files

        proportions = []
        for f in cell_files:
            if os.stat(f).st_size == 0:
                continue
            df = pd.read_csv(f)
            df.index = df.columns
            if node1 not in df.columns or node2 not in df.columns:
                continue
            val = np.clip(float(df.loc[node1, node2]), 0, 1)
            proportions.append(val)

        table[s, c] = np.mean(proportions) if proportions else 0.0

# Apply diff encoding: +proportion if TP edge, -proportion if FP edge
diff_table = np.zeros_like(table)
for s in range(n_sim_setups):
    true_df = pd.read_csv(true_adjmat_files[s])
    true_df.index = true_df.columns
    if node1 in true_df.columns and node2 in true_df.columns:
        is_true_edge = float(true_df.loc[node1, node2]) > 0
    else:
        is_true_edge = False

    for c in range(n_alg_confs):
        prop = table[s, c]
        if is_true_edge:
            diff_table[s, c] = prop
        else:
            diff_table[s, c] = -prop if prop > 0 else 0

diff_df = pd.DataFrame(diff_table, index=sim_setup_labels, columns=alg_conf_ids)
diff_df.to_csv(f"{output_dir}/{edge_str}_table.csv")

# Heatmap
cmap = sns.diverging_palette(10, 130, as_cmap=True)

def _fmt(v):
    v = abs(v)
    if v == 0 or v == 1:
        return ""
    return f"{v:.2f}".lstrip("0").rstrip("0").rstrip(".")

annot_data = diff_df.applymap(_fmt) if annot else False
if figsize is not None:
    plt.figure(figsize=figsize)
with sns.axes_style("white"):
    sns.heatmap(diff_df, annot=annot_data, fmt="", linewidth=1,
                cmap=cmap,
                vmin=-1.0, vmax=1.0, square=True,
                cbar=show_cbar, center=0,
                xticklabels=1, yticklabels=1,
                annot_kws={"size": annot_fontsize} if annot else {})

plt.tick_params(axis="both", labelsize=6)
if show_cbar:
    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)
if show_title:
    plt.title(f"Edge: {node1} — {node2}\nGraph type: {graph_type}\nGreen=TP, Red=FP",
              fontsize=6, ha="center")
plt.tight_layout()
plt.savefig(f"{output_dir}/{edge_str}_heatmap.{fmt}", dpi=300, bbox_inches="tight")
plt.clf()

# LaTeX table
if latex:
    latex_index = latex_row_labels if latex_row_labels is not None else sim_setup_labels

    def _cell(v):
        abs_v = abs(v)
        opacity = int(round(abs_v * 100))
        color = "green" if v >= 0 else "red"
        bg = f"\\cellcolor{{{color}!{opacity}}}"
        if abs_v == 0:
            return f"{bg}."
        if abs_v == 1:
            return bg
        return f"{bg}{abs_v:.2f}".replace("0.", ".")

    latex_df = diff_df.copy()
    latex_df.index = latex_index

    n_cols = len(alg_conf_ids)
    col_fmt = "l" + "r" * n_cols
    lines = []
    lines.append("% Requires \\usepackage[table]{xcolor} in preamble")
    lines.append("\\begin{table}[ht]")
    lines.append("\\centering")
    lines.append(f"\\caption{{Edge frequency table for edge ${node1}$--${node2}$ "
                 f"(graph type: {graph_type}). "
                 f"Green = TP, red = FP; opacity encodes fraction.}}")
    lines.append(f"\\label{{tab:eft_{edge_str}_{graph_type}}}")
    lines.append(f"\\begin{{tabular}}{{{col_fmt}}}")
    lines.append("\\toprule")
    lines.append(" & ".join([""] + list(alg_conf_ids)) + " \\\\")
    lines.append("\\midrule")
    for row_label, (_, row) in zip(latex_index, latex_df.iterrows()):
        lines.append(" & ".join([row_label] + [_cell(v) for v in row]) + " \\\\")
    lines.append("\\bottomrule")
    lines.append("\\end{tabular}")
    lines.append("\\end{table}")

    with open(f"{output_dir}/{edge_str}_table.tex", "w") as f:
        f.write("\n".join(lines) + "\n")

