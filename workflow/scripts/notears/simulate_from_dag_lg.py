import argparse
import numpy as np
import notears
import pandas as pd

def main(n_samples, mean, variance, filename, weighted_adjmat_filename, seed):
    adjmat_df = pd.read_csv(weighted_adjmat_filename)
    np.random.seed(seed)
    data = np.array(notears.utils.simulate_from_dag_lg(adjmat_df.values, 
                                                        n_samples, 
                                                        mean=mean, 
                                                        variance=variance))
    pd.DataFrame(data).to_csv(filename, header=adjmat_df.columns, sep=" ", index=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser("Sample DAG.")

    parser.add_argument(
        '-n', '--n_samples',
        type=int, required=True
    )
    parser.add_argument(
        '-m', '--mean',
        type=float, required=True
    )
    parser.add_argument(
        '-v', '--variance',
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
        '-d', '--weighted_adjmat_filename',
        required=True,
        help="Weighted adjacancy matrix filename"
    )

    args = parser.parse_args()
    main(**args.__dict__)
