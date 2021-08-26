<snippet>
  <content><![CDATA[
# ${1:Systematic benchmarks of structure learning algorithms for graphical models}

[![Snakemake](https://img.shields.io/badge/snakemake-≥5.2.0-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Documentation Status](https://readthedocs.org/projects/benchpressdocs/badge/?version=latest)](https://benchpressdocs.readthedocs.io/en/latest/?badge=latest)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

#  
# Benchpress


Benchpress [[1]](#1) is a [Snakemake](https://snakemake.readthedocs.io/en/stable/) workflow where structure learning algorithms, implemented in possibly different languages, can be executed and compared.
The computations scale seamlessly on multiple cores or *"... to server, cluster, grid and cloud environments, without the need to modify the workflow definition" - Snakemake*.
The documentation is found at https://benchpressdocs.readthedocs.io.

The currently supported algorithms are tabulated below.

| Algorithm        | Graph | Language | Library             | Version  | 
|------------------|-------|----------|---------------------|----------|
| GOBNILP          | DAG   | C        | GOBNILP (bitbucket) | #e60ef14 |
| ASOBS            | DAG   | R/Java   | r.blip              | 1.1      |
| FGES             | CPDAG | Java     | TETRAD (causal-cmd) | 1.1.3    |
| FCI              | DAG   | Java     | TETRAD (causal-cmd) | 1.1.3    |
| RFCI             | CPDAG | Java     | TETRAD (causal-cmd) | 1.1.3    |
| GFCI             | DAG   | Java     | TETRAD (causal-cmd) | 1.1.3    |
| PC               | CPDAG | R        | pcalg               | 2.6-10   |
| No tears         | DAG   | Python   | jmoss20 (github)    | #0c032a0 |
| HC               | DAG   | R        | bnlearn             | 4.5      |
| MMHC             | DAG   | R        | bnlearn             | 4.5      |
| Inter-IAMB       | CPDAG | R        | bnlearn             | 4.5      |
| GS               | DAG   | R        | bnlearn             | 4.5      |
| Tabu             | DAG   | R        | bnlearn             | 4.5      |
| Iterative MCMC   | DAG   | R        | BiDAG               | 2.0.2    |
| Order MCMC       | DAG   | R        | BiDAG               | 2.0.2    |
| PGibbs           | DG    | Python   | Trilearn            | 1.2.3    |
| GG99 single pair | DG    | Java     | A. Thomas           | -        |
| GT13 multi pair  | DG    | Java     | A. Thomas           | -        |
| GLasso           | UG    | Python   | scikit-learn        | 0.22.1   |

Acronyms are used for Directed Acyclic Graphs (DAGs), Undirected Graphs (UGs), Decomposable Graphs (DGs), and Completed Partially DAGs (CPDAGs).

## Requirements
- [Snakemake ≥ 5.2](https://snakemake.readthedocs.io/en/stable/) ([installation instructions](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html))
- [Singularity ≥ 3.2](https://sylabs.io/docs/) ([installation instructions](https://sylabs.io/guides/3.6/admin-guide/installation.html))
- Linux (Singularity currently only has a Beta release for OSX which is not enough)
## Installation

### Clone and install

```
$ git clone https://github.com/felixleopoldo/benchpress.git
$ cd benchpress
```

#### Notes
On some systems, you might also have to explicitly install squash-tools. This can be done using conda as

`$ conda install -c conda-forge squash-tools`

## Usage

### Example study

This study is based on three continuous datasets corresponing to three realisations of a random structural equation model (SEM) with random DAG. The DAGs are sampled from Erdős–Rényi distribution using the **pcalg_randdag** module and the weight parameters are sampled uniformly on the interval [-1, -0.25] U [0.25, 1] using the **sem_params** module. For simplicity we use only a few structure learning modules here (**order_mcmc**, **tetrad_fges**, **bnlearn_mmhc**, **pcalg_pc**) with different parameter settings. The full setup is found here [config/ex.json](config/ex.json).

To run this study (266 jobs ~ 10 minutes on a laptop) type

`$ snakemake --cores all --use-singularity --configfile config/ex.json`

#### Sample output
Below we show output corresponding to one dataset produced by the order MCMC algorithm. Below is some of the output produced by the modules **adjmat_true_plots**, **adjmat_plots**, **heatmap_plots**, **autocorr_plots**, **mcmc_plot_traj**, and **roc** for the order MCMC algorithm (**order_mcmc** module). The results are saved in *results/output/*. 

##### True adjacency matrix (adjmat_true_plots)
<img src="images/adjmat_true_1.png" alt="drawing" width="600"/>

##### Estimated adjacency matrix (adjmat_plots)
<img src="images/adjmat_14.png" alt="drawing" width="600"/>

##### Estimated mean graph (heatmap_plots)
<img src="images/heatmap_1.png" alt="drawing" width="600"/>

##### Estimated auto-correlation of graph posterior (autocorr_plots)
<img src="images/mcmc_autocorr_1.png" alt="drawing" width="600"/>

##### Plot of the graph posterior trajectory (mcmc_traj_plots)
<img src="images/trajplot_1.png" alt="drawing" width="600"/>

##### ROC plot (roc)
<img src="images/FPR_TPR_skel.png" alt="drawing" width="600"/>


### Paper study
To run the simulation setup in Section 5.1 of [[1]](#1) use [config/sec6.1.json](config/sec6.1.json) and type

`$ snakemake --cores all --use-singularity --configfile config/sec6.1.json`

A roc curve is found in the file [results/output/roc/FPRp_TRP_pattern.eps]() and can be viewed with e.g. evince as

`$ evince results/output/roc/FPRp_TRP_pattern.eps`

<!-- ![ROC](docs/source/_static/ROC_randbinarybnreps50.png) -->
<img src="docs/source/_static/ROC_randbinarybnreps50.png" alt="drawing" width="600"/>


This study took about 2h to finish on a 80 cores machine and is probably too large (~8000 jobs) for a laptop user.



## Citing

```
@misc{rios2021benchpress,
      title={Benchpress: a scalable and platform-independent workflow for benchmarking structure learning algorithms for graphical models}, 
      author={Felix L. Rios and Giusi Moffa and Jack Kuipers},
      year={2021},
      eprint={2107.03863},
      archivePrefix={arXiv},
      primaryClass={stat.ML}
}
```

## References
* <a id="1">[1]</a> [Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and platform-independent workflow for benchmarking structure learning algorithms for graphical models. *ArXiv eprints.*, 2107.03863, 2021.](https://arxiv.org/abs/2107.03863)



## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Contact me at felix leopoldo rios at gmail com


## License

This project is licensed under the GPL-2.0 License - see the [LICENSE](LICENSE) file for details

</content>
  <tabTrigger></tabTrigger>
</snippet>
