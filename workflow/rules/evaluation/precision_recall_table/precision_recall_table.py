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

# Build TP/P and FP/P tables: shape (n_sim_setups, n_alg_confs)
tp_table = np.zeros((n_sim_setups, n_alg_confs))
fp_table = np.zeros((n_sim_setups, n_alg_confs))
file_offset = 0

for s in range(n_sim_setups):
    true_df = pd.read_csv(true_adjmat_files[s])
    true_df.index = true_df.columns
    true_mat = (true_df.values > 0).astype(float)
    n_true = true_mat.sum()
    n_false = (1 - true_mat).sum() - true_mat.shape[0]  # exclude diagonal

    for c in range(n_alg_confs):
        cell_idx = s * n_alg_confs + c
        n_files = blocks[cell_idx]
        cell_files = all_adjmat_files[file_offset:file_offset + n_files]
        file_offset += n_files

        tp_vals = []
        fp_vals = []
        for f in cell_files:
            if os.stat(f).st_size == 0:
                continue
            df = pd.read_csv(f)
            df.index = df.columns
            # Align columns with true adjmat
            common = [col for col in true_df.columns if col in df.columns]
            if len(common) == 0:
                continue
            est = np.clip(df.loc[common, common].values, 0, 1)
            true = true_mat[np.ix_(
                [list(true_df.columns).index(c) for c in common],
                [list(true_df.columns).index(c) for c in common]
            )]
            tp = (est * true).sum()
            fp = (est * (1 - true)).sum()
            # Subtract diagonal contributions
            diag_est = np.diag(est)
            diag_true = np.diag(true)
            fp -= (diag_est * (1 - diag_true)).sum()

            if n_true > 0:
                tp_vals.append(tp / n_true)
            if n_false > 0:
                fp_vals.append(fp / n_false)

        tp_table[s, c] = np.mean(tp_vals) if tp_vals else 0.0
        fp_table[s, c] = np.mean(fp_vals) if fp_vals else 0.0

# Build interleaved DataFrame for heatmap (TP/P positive, FP/P negative)
col_names = []
heatmap_data = np.zeros((n_sim_setups, n_alg_confs * 2))
for c, alg_id in enumerate(alg_conf_ids):
    col_names.append(f"{alg_id} TP/P")
    col_names.append(f"{alg_id} FP/P")
    heatmap_data[:, c * 2] = tp_table[:, c]
    heatmap_data[:, c * 2 + 1] = -fp_table[:, c]

heatmap_df = pd.DataFrame(heatmap_data, index=sim_setup_labels, columns=col_names)

# CSV with raw positive values
csv_data = np.zeros((n_sim_setups, n_alg_confs * 2))
csv_col_names = []
for c, alg_id in enumerate(alg_conf_ids):
    csv_col_names.append(f"{alg_id} TP/P")
    csv_col_names.append(f"{alg_id} FP/P")
    csv_data[:, c * 2] = tp_table[:, c]
    csv_data[:, c * 2 + 1] = fp_table[:, c]

csv_df = pd.DataFrame(csv_data, index=sim_setup_labels, columns=csv_col_names)
csv_df.to_csv(f"{output_dir}/table.csv")

# Heatmap
cmap = sns.diverging_palette(10, 130, as_cmap=True)

def _fmt(v):
    abs_v = abs(v)
    if abs_v == 0 or abs_v == 1:
        return ""
    return f"{abs_v:.2f}".lstrip("0").rstrip("0").rstrip(".")

annot_data = heatmap_df.applymap(_fmt) if annot else False
if figsize is not None:
    plt.figure(figsize=figsize)
with sns.axes_style("white"):
    sns.heatmap(heatmap_df, annot=annot_data, fmt="", linewidth=1,
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
    plt.title(f"Precision/Recall table\nGraph type: {graph_type}\nGreen=TP/P, Red=FP/P",
              fontsize=6, ha="center")
plt.tight_layout()
plt.savefig(f"{output_dir}/heatmap.{fmt}", dpi=300, bbox_inches="tight")
plt.clf()

# LaTeX table
if latex:
    latex_index = latex_row_labels if latex_row_labels is not None else sim_setup_labels

    def _cell_tp(v):
        opacity = int(round(v * 70))
        bg = f"\\cellcolor{{bpgreen!{opacity}}}"
        if v == 0:
            return ""
        if v == 1:
            return bg
        return f"{bg}{v:.2f}".replace("0.", ".")

    def _cell_fp(v):
        opacity = int(round(v * 70))
        bg = f"\\cellcolor{{red!{opacity}}}"
        if v == 0:
            return ""
        if v == 1:
            return bg
        return f"{bg}{v:.2f}".replace("0.", ".")

    n_cols = n_alg_confs * 2
    col_fmt = "l" + "rr" * n_alg_confs
    lines = []
    lines.append("% Requires \\usepackage[table]{xcolor} in preamble")
    lines.append("\\colorlet{bpgreen}{green!70!black}")
    lines.append("\\begin{table}[ht]")
    lines.append("\\centering")
    lines.append(f"\\caption{{Precision/recall table (graph type: {graph_type}). "
                 f"Green = TP/P (recall), red = FP/P; opacity encodes value.}}")
    lines.append(f"\\label{{tab:prt_{graph_type}}}")
    lines.append(f"\\begin{{tabular}}{{{col_fmt}}}")
    lines.append("\\toprule")
    # Multi-column header row
    mcols = " & ".join(
        [""] + [f"\\multicolumn{{2}}{{c}}{{{alg_id}}}" for alg_id in alg_conf_ids]
    ) + " \\\\"
    lines.append(mcols)
    # Sub-header row
    subheader = " & ".join([""] + ["TP/P & FP/P"] * n_alg_confs) + " \\\\"
    lines.append(subheader)
    lines.append("\\midrule")
    for row_idx, row_label in enumerate(latex_index):
        cells = [row_label]
        for c in range(n_alg_confs):
            cells.append(_cell_tp(tp_table[row_idx, c]))
            cells.append(_cell_fp(fp_table[row_idx, c]))
        lines.append(" & ".join(cells) + " \\\\")
    lines.append("\\bottomrule")
    lines.append("\\end{tabular}")
    lines.append("\\end{table}")

    with open(f"{output_dir}/table.tex", "w") as f:
        f.write("\n".join(lines) + "\n")
