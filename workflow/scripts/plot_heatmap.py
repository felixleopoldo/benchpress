from trilearn import auxiliary_functions as aux
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def main(adjmat_filename, output_filename):
    heatmap = pd.read_csv(adjmat_filename)


    heatmap.index = heatmap.columns
#    aux.plot_heatmap(heatmap, cbar=False, annot=False,
#                     xticklabels=1,
#                     yticklabels=1)

    with sns.axes_style("white"):
        sns.heatmap(heatmap,  annot=False,
                    cmap="Blues",
                    vmin=0.0, vmax=1.0, square=True,
                    cbar=False,
                    xticklabels=1, yticklabels=1)
    #sns.set_style("whitegrid")
    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)
    cax = plt.gcf().axes[-1]
    cax.tick_params(labelsize=6)
    plt.savefig(output_filename)
    plt.clf()

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser("Plot adjacency matrix or heatmap")

    parser.add_argument(
        '-o', '--output_filename',
        required=True,
        help="Output filename"
    )
    parser.add_argument(
        '-f', '--adjmat_filename',
        required=True,
        help="Filename of adjacency matrix. "
    )

    args = parser.parse_args()
    main(**args.__dict__)
