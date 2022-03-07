from castle.algorithms import Notears
import pandas as pd

if(snakemake.params["alg"] == "notears"):
    df = pd.read_csv(snakemake.input["data"])

    n = Notears(lambda1=float(snakemake.wildcards["lambda1"]),
                loss_type=snakemake.wildcards["loss_type"],
                max_iter=int(snakemake.wildcards["max_iter"]),
                h_tol=float(snakemake.wildcards["h_tol"]),
                rho_max=float(snakemake.wildcards["rho_max"]),
                w_threshold=float(snakemake.wildcards["w_threshold"]))
    n.learn(df.values,colums = df.columns)

    adjmat_df = pd.DataFrame(n.causal_matrix)
    adjmat_df.columns = df.columns
    
    adjmat_df.to_csv(snakemake.output["adjmat"], index=False)
    
    with open(snakemake.output["time"], "w") as text_file:
        text_file.write("0")
    
    with open(snakemake.output["ntests"], "w") as text_file:
        text_file.write("None")