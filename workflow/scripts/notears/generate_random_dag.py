
import numpy as np
import notears
import argparse
import os

def main(num_nodes, num_edges, filename, seed):
    edge_coefficient_range = [-1, 1]
    np.random.seed(seed)
    true_adj_mat, _ = notears.utils.generate_random_dag(num_nodes, num_edges, edge_coefficient_range=edge_coefficient_range)
    true_adj_mat = abs(true_adj_mat) > 0
    header = np.array([list(range(len(true_adj_mat)))])
    tosave = np.append(header,true_adj_mat, axis=0)
    np.savetxt(filename, tosave, delimiter=",", fmt="%i")

if __name__ == "__main__":
    parser = argparse.ArgumentParser("Sample DAG.")
    parser.add_argument(
        '-p', '--num_nodes',
        type=int, required=True,
        help="Number of nodes"
    )
    parser.add_argument(
        '-e', '--num_edges',
        type=int, required=True,
        help="Number of edges"
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

    args = parser.parse_args()
    main(**args.__dict__)