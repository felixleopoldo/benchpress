import argparse
import numpy as np
import notears
#import pandas as pd

def main(n_samples, mean, variance, filename, weighted_adjmat_filename, seed):

    #adjmat = np.genfromtxt(weighted_adjmat_filename, dtype=float, skip_header=1)
    adjmat = np.loadtxt(weighted_adjmat_filename, delimiter=",",skiprows=1, dtype=float)
    print(adjmat)
    data = np.array(notears.utils.simulate_from_dag_lg(  adjmat, 
                                                n_samples, 
                                                mean=mean, 
                                                variance=variance))
    print(data)
    header = np.array([list(range(data.shape[1]))])
    tosave = np.append(header,data, axis=0)

    np.savetxt(filename, tosave, delimiter=" ")

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
