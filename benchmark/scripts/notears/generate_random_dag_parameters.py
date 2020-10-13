import numpy as np
import notears
import argparse
import networkx as nx
import pandas as pd

def main(dag_filename, edge_coefficient_range_from, edge_coefficient_range_to, 
         filename, seed):
    edge_coefficient_range = [edge_coefficient_range_from, edge_coefficient_range_to]
    np.random.seed(seed)

    # IMPORANT, the dag must have been generated by the same method and seed.
    # TODO: This is a workaround since notears dont separate DAG and parameters.
    adjmat_df = pd.read_csv(dag_filename)
    dag = nx.from_numpy_matrix(adjmat_df.values, create_using=nx.DiGraph)
    num_nodes = dag.order()
    num_edges = dag.size()

    true_adj_mat, _ = notears.utils.generate_random_dag(num_nodes, num_edges, edge_coefficient_range=edge_coefficient_range)

    pd.DataFrame(true_adj_mat).to_csv(filename, header=adjmat_df.columns, index=False)


if __name__ == "__main__":
    parser = argparse.ArgumentParser("Sample DAG.")

    parser.add_argument(
        '-f', '--edge_coefficient_range_from',
        type=float, required=True
    )
    parser.add_argument(
        '-t', '--edge_coefficient_range_to',
        type=float, required=True
    )
    parser.add_argument(
        '-s', '--seed',
        type=int, required=True
    )
    parser.add_argument(
        '-F', '--filename',
        required=True,
        help="Output filename"
    )
    parser.add_argument(
        '-d', '--dag_filename',
        required=True,
        help="DAG filename"
    )

    args = parser.parse_args()
    main(**args.__dict__)