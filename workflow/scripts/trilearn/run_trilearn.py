import trilearn

#!/usr/bin/env python

"""
Generate a Markov chain from particle Gibbs for different
parameter settings.
"""

import numpy as np
import pandas as pd

import trilearn.pgibbs
import json


def main(data_filename, n_particles, trajectory_lengths, pseudo_observations,
         alphas, betas, radii, seed, parallel, output_directory, reset_cache, reps, **args):
    if seed is not None:
        np.random.seed(seed)

    df = pd.read_csv(data_filename, sep=',', header=[0, 1])
    n_levels = [int(a[1]) for a in list(df.columns)]
    levels = np.array([range(l) for l in n_levels])


    trilearn.pgibbs.sample_trajectories_loglin_to_file(df, n_particles, trajectory_lengths,
                                                        pseudo_observations=pseudo_observations, alphas=alphas, betas=betas,
                                                        radii=radii, reps=reps, reset_cache=reset_cache,
    
    graph_trajectory = sample_trajectory(n_particles, alpha, beta, radius, n_samples, seqdist, reset_cache=reset_cache)
    adjtraj = graph_trajectory.get_adjmat_trajectory()

    

    if not os.path.exists(dir):
        os.mkdir(dir)

    filename = dir + "/" + str(graph_trajectory) +"_"+ date + ".json"
    graph_trajectory.write_file(filename=filename)   
    output_directory=output_directory)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser("Generate particle Gibbs trajectories och decomposable graphs.")

    parser.add_argument(
        '-M', '--trajectory_lengths',
        type=int, required=True, nargs='+',
        help="Number of Gibbs samples"
    )
    parser.add_argument(
        '-f', '--data_filename',
        required=True,
        help="Filename of dataset stored as row vectors och floats. "
    )
    parser.add_argument(
        '-N', '--n_particles',
        type=int, required=True, nargs='+',
        help="Number of SMC particles"
    )
    parser.add_argument(
        '-a', '--alphas',
        type=float, required=False, default=[0.5], nargs='+',
        help="Parameter for the Christmas tree algorithm"
    )
    parser.add_argument(
        '-b', '--betas',
        type=float, required=False, default=[0.5], nargs='+',
        help="Parameter for the Christmas tree algorithm"
    )
    parser.add_argument(
        '-r', '--radii',
        type=int, required=False, default=[None], nargs='+',
        help="The search neighborhood radius for the Gibbs sampler"
    )
    parser.add_argument(
        '-s', '--seed',
        type=int, required=False, default=None
    )
    parser.add_argument(
        '--pseudo_observations',
        type=float, required=False, default=[1.0], nargs='+',
        help="Total number of pseudo observations"
    )
    parser.add_argument(
        '--reps',
        type=int, required=False, default=1,
        help='Number of trajectories to sample for each parameter setting'
    )
    parser.add_argument(
        '--parallel',
        required=False, action="store_true"
    )
    parser.add_argument(
        '-o', '--output_directory',
        required=False, default=".",
        help="Output directory"
    )
    parser.add_argument(
        '--reset_cache',
        required=False, default=True, action="store_true",
        help="Reset the cache in each iteration"
    )

    args = parser.parse_args()
    main(**args.__dict__)