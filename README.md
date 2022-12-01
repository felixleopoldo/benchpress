<snippet>
  <content>


<p align="left">
<a href="https://benchpressdocs.readthedocs.io/" target="_blank" rel="noopener noreferrer">
<img width="248"  src="docs/source/_static/benchpress-logo-white-bg.png" alt="Benchpress logo">
</a>
</p>


[![Snakemake](https://img.shields.io/badge/snakemake-≥7.14-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Documentation Status](https://readthedocs.org/projects/benchpressdocs/badge/?version=latest)](https://benchpressdocs.readthedocs.io/en/latest/?badge=latest)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

---

Benchpress [[1]](#1) is a [Snakemake](https://snakemake.readthedocs.io/en/stable/) workflow where structure learning algorithms, implemented in possibly different languages, can be executed and compared.
The computations scale seamlessly on multiple cores or *"... to server, cluster, grid and cloud environments, without the need to modify the workflow definition" - Snakemake*.
The documentation (to be updated) is found at https://benchpressdocs.readthedocs.io. 
<!-- [This](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#evaluation) section shows an overview of the supported evaluation methods. -->

The following main functionalities are provided by Benchpress 

* Benchmarks - Benchmark publically available structure learning algorithms.
* Algorithm development - Benchmark your own algorithm along with the existing ones while developing.
* Data analysis - Estimate the underlying graph structure for your own dataset(s).

You may also have a look at [this Medium story](https://medium.com/@felixleopoldorios/structure-learning-using-benchpress-826847db0aa8) for an introduction to Benchpress.

## Requirements

### Linux 
- [Snakemake](https://snakemake.readthedocs.io/en/stable/) ([installation instructions](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html))
- [Apptainer](https://apptainer.org/) ([installation instructions](https://apptainer.org/docs/admin/main/installation.html#installation-on-linux))

#### Notes
Some systems require explicit installation of squash-tools. Using conda it can be installed as

`$ conda install -c conda-forge squash-tools`
    
### macOS/Windows    
Benchpress cannot run directly on macOS/Windows as it requires Apptainer (former [Singularity](https://sylabs.io/singularity/)) which is only supported by Linux systems. However, Linux can be installed (and the requirements above) on a virtual machine via e.g. VirtualBox. 
    
- [VirtualBox](https://www.virtualbox.org/) ([instructions for installing Ubuntu](https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview))



## Installation

### Clone and install
As Benchpress is a Snakemake workflow, once the requirements are installed it requires no further installation but cloning the repository as
```
$ git clone https://github.com/felixleopoldo/benchpress.git
```
    
#### Notes
If you are using a virtualiser such as VirtualBox, this folder should be located on macOS/Windows and shared to the virtual machine. In this way, all the files used by Benchpress are reachable from macOS/Windows. 
    
## Usage

Benchpress supports five different data scenarios, built from combining different sources of graph parameters and data.


|     | Graph     | Parameters | Data      |
|-----|-----------|------------|-----------|
| I   | -         | -          | Fixed     |
| II  | Fixed     | -          | Fixed     |
| III | Fixed     | Fixed      | Generated |
| IV  | Fixed     | Generated  | Generated |
| V   | Generated | Generated  | Generated |

The directory [resources/](resources) contains the fixed graphs, parameters, and datasets that are already available. 
It contains, e.g., all the graphs (and corresponding parameters) from the [Bayesian networks repository](https://www.cs.huji.ac.il/w~galel/Repository/), downloaded from [bnlearns homepage](https://www.bnlearn.com/). You can also place your own files in the corresponding directories and use them in the same way as the existing ones.
The methods to generate graphs, parameters and data are listed further down.

#### Example study
This study is an example of data scenario V based on three continuous datasets, sampled using the [iid](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#iid) module, corresponding to three realisations of a random linear Gaussian [structural equation model](https://en.wikipedia.org/wiki/Structural_equation_modeling) (SEM) with random DAG. The DAGs are sampled from a restricted [Erdős–Rényi distribution](https://en.wikipedia.org/wiki/Erd%C5%91s%E2%80%93R%C3%A9nyi_model) using the [pcalg_randdag](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#pcalg-randdag) module and the weight parameters are sampled uniformly using the [sem_params](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#sem-params) module. For simplicity we use only a few structure learning modules here ([bidag_itsearch](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#bidag-itsearch), [tetrad_fges](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#tetrad-fges), [bnlearn_tabu](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#bnlearn-tabu), [pcalg_pc](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#pcalg-pc)) with different parameter settings. The full setup is found in [config/config.json](config/config.json).

To run this study (354 jobs ~ 10 minutes on a 2-cores laptop) type

`$ snakemake --cores all --use-singularity --configfile config/config.json`

The following plots are generated by the [benchmarks](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#benchmarks) module

<img src="docs/source/_static/FPR_TPR_skel.png" alt="drawing" width="400"/><img src="docs/source/_static/elapsed_time_joint.png" alt="drawing" width="400"/>

<img src="docs/source/_static/SHD_cpdag_joint.png" alt="drawing" width="400"/><img src="https://github.com/felixleopoldo/benchpress/blob/master/docs/source/_static/f1_skel_joint.png" alt="F1" width="400"/>

These plots are generated by the [graph_plots](https://benchpressdocs.readthedocs.io/en/latest/json_overview.html#graph-plots) module
    
<img src="docs/source/_static/adjmat_true_1.png" alt="True adjacency matrix plot" width="400"/><img src="docs/source/_static/adjmat_plot_2.png" alt="Estimated adjacency matrix plot" width="400"/>


<img src="docs/source/_static/diffplot_2.png" alt="Adjacency difference matrix plot" width="400"/><img src="https://github.com/felixleopoldo/benchpress/blob/master/docs/source/_static/compare_14-2.png" alt="graphviz.compare plot from bnlearn" width="400"/>
 

#### Adding a new structure learning algorithm
You can easily either develop your own, or add a existing algorithm to Benchpress, regardless of the programming language. Each algorithm has its own sub directory of [workflow/rules/structure_learning_algorithms/](workflow/ruless/structure_learning_algorithms/), and adding a new one is done by either copying one of the existing ones and change the relevant parts, or you can generate a template structure learning module with the command

`$ snakemake --cores all new_alg`

This will copy the boilerplate structure learning module called *new_alg* (the name may be changed) from [resources/module_templates/](resources/module_templates/new_alg) to [workflow/rules/structure_learning_algorithms/](workflow/ruless/structure_learning_algorithms/). You can then alter the template R-script [script.R](resources/module_templates/alg_module/script.R) (could also be some other language) as you like. It looks as follows at the moment:

```r
myparam1 <- snakemake@wildcards[["myparam1"]] 
myparam2 <- snakemake@wildcards[["myparam2"]]
data <- read.csv(snakemake@input[["data"]], check.names = FALSE)

# This is a very fast way to estimate an undirected graph.
p <- ncol(data)
set.seed(as.integer(snakemake@wildcards[["replicate"]]))
start <- proc.time()[1]
adjmat <- matrix(runif(p * p), nrow = p, ncol = p) > 0.8 
adjmat <- 1 * (adjmat | t(adjmat)) # Make it symmetric (undirected)
diag(adjmat) <- 0 # No self loops
colnames(adjmat) <- names(data) # Get labels from the data
totaltime <- proc.time()[1] - start

write.csv(adjmat, file = snakemake@output[["adjmat"]], row.names = FALSE, quote = FALSE)
write(totaltime, file = snakemake@output[["time"]])
write("None", file = snakemake@output[["ntests"]]) # Number of c.i. tests
```
The parameters used in the first two lines above are automatically generated from the JSON object in the *structure_learning_algorithms* section of the config file. You may add or change these keys or values. To test it you need to add the *id*, (i.e. *testing_myalg*) e.g. to the list of ids in the [benchmarks](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-benchmarks-item.md) section. 

```javascript
{
    "id": "testing_myalg",
    "timeout": null,
    "myparam1": "somevalue",
    "myparam2": [
        1,
        2
    ]
}

```
If you want to use another programming language or link to some of your own scripts, you can edit [rule.smk](resources/module_templates/alg_module/rule.smk) to suite your algorithm. 

```python

rule:
    input:
        data = alg_input_data()        
    output:
        adjmat = alg_output_adjmat_path(module_name),
        time = alg_output_time_path(module_name),
        ntests = alg_output_ntests_path(module_name)
    container:
        None 
    script:            
        "script.R"
```
If R is not installed on your system, you may change the container from None to "docker://r-base" in order to run the script in an Apptainer container based on the [r-base](https://hub.docker.com/_/r-base) Docker image.

#### Pushing an algorithm to the Benchpress repository 
To push an algorithm to the Benchpress repository, you should follow the Contributing steps below. Technically, you need to install the algorithms requirements on a [Docker](https://www.docker.com/?utm_source=google&utm_medium=cpc&utm_campaign=search_emea_brand&utm_term=docker_exact&gclid=Cj0KCQjw39uYBhCLARIsAD_SzMT16rxbGonghr8uVXB_mcteQHoohQ1fyjiVQE5VVj7kYDDIl_Ty5vkaAsqqEALw_wcB) image and push it to [Docker Hub](https://hub.docker.com/). Then the container field must be changed to the correct uri.

### Available modules

#### Graph modules
| Method                 | Graph | Language | Library                                                                | Version | Module id                                                                                                                                       |
|------------------------|-------|----------|------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| randDAG                | DAG,UG| R        | [pcalg](https://cran.r-project.org/web/packages/pcalg/index.html)      | 2.7-3   | [pcalg_randdag](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-pcalg_randdag-item.md)       |
| graph.sim              | DG,UG | R        | [BDgraph](https://cran.r-project.org/web/packages/BDgraph/index.html)  | 2.64    | [bdgraph_graphsim](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bdgraph_graphsim-item.md) |
| CTA [[24]](#24)        | DG    | Python   | [trilearn](https://github.com/felixleopoldo/trilearn)                  | 1.2.3   | [trilearn_cta](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-trilearn_cta-item.md)         |
| AR                     | DG    | Python   | [trilearn](https://github.com/felixleopoldo/trilearn)                  | 1.2.3   | [bandmat](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bandmat-item.md)                   |
| AR random lag          | DG    | Python   | [trilearn](https://github.com/felixleopoldo/trilearn)                  | 1.2.3   | [rand_bandmat](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-rand_bandmat-item.md)         |
| Fixed adjacency matrix | *     | .csv     | -                                                                      | -       | -                                                                                                                                               |

#### Parameter modules

| Distribution               | Method | Graph  | Language | Library                                                                | Version | Module id                                                                                                                                                |
|----------------------------|--------|--------|----------|------------------------------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Graph Wishart              | rgwish | DG, UG | R        | [BDgraph](https://cran.r-project.org/web/packages/BDgraph/index.html)  | 2.64    | [bdgraph_rgwish](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bdgraph_rgwish-item.md)              |
| Hyper Dirichlet [[2]](#2)  | -      | DG     | Python   | [trilearn](https://github.com/felixleopoldo/trilearn)                  | 1.2.3   | [trilearn_hyper-dir](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-trilearn_hyper-dir-item.md)      |
| Graph intra-class          | -      | DG     | Python   | [trilearn](https://github.com/felixleopoldo/trilearn)                  | 1.2.3   | [trilearn_intra-class](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-trilearn_intra-class-item.md)  |
| Random SEM parameters      | -      | DAG    | R        | -                                                                      | -       | [sem_params](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-sem_params-item.md)                      |
| Random probability tables  | -      | DAG    | R        | -                                                                      | -       | [bin_bn](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bin_bn-item.md)                              |
| Fixed bn.fit object        | -      | DAG    | .rds     | [bnlearn](https://www.bnlearn.com/)                                    | -       | -                                                                                                                                                        |
| Fixed SEM parameter matrix | -      | DAG    | .csv     | -                                                                      | -       | -                                                                                                                                                        |


#### Data modules
| Method              | Language | Module id                                                                                                              |
|---------------------|----------|------------------------------------------------------------------------------------------------------------------------|
| I.I.D. data samples | -        | [iid](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-iid.md)       |
| SEM I.I.D. data samples  | Python        | [gcastle_iidsim](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_iidsim.md)       |
| Fixed data file     | .csv     | -                                                                                                                      |

#### Structure learning algorithms

| Algorithm                         | Graph | Language | Library                                                                                                    | Version  | Module id                                                                                                                                                  |
|-----------------------------------|-------|----------|------------------------------------------------------------------------------------------------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GOBNILP [[3]](#3)[[33]](#33)[[34]](#34)                 | DAG   | C        | [GOBNILP](https://bitbucket.org/jamescussens/gobnilp)                                                      | #4347c64 | [gobnilp](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gobnilp-item.md)                              |
| GSP   [[35]](#35)                 | CPDAG | Python   | [causalDAG](https://github.com/uhlerlab/causaldag)                                        | 0.1a163      | [causaldag_gsp](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-greedy-sparsest-permutations-gsp.md)                      |
| ASOBS [[15]](#15)                 | DAG   | R/Java   | [r.blip](https://cran.r-project.org/web/packages/r.blip/index.html)                                        | 1.1      | [rblip_asobs](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-rblip_asobs-item.md)                      |
| FGES [[9]](#9)                    | CPDAG | Java     | [TETRAD](https://bd2kccd.github.io/docs/causal-cmd/)                                          | 1.1.3    | [tetrad_fges](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-tetrad_fges-item.md)                      |
| FCI [[5]](#5)                     | DAG   | Java     | [TETRAD](https://bd2kccd.github.io/docs/causal-cmd/)                                          | 1.1.3    | [tetrad_fci](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-tetrad_fci-item.md)                        |
| RFCI [[22]](#22)                  | CPDAG | Java     | [TETRAD](https://bd2kccd.github.io/docs/causal-cmd/)                                          | 1.1.3    | [tetrad_rfci](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-tetrad_rfci-item.md)                      |
| GFCI [[21]](#21)                  | DAG   | Java     | [TETRAD](https://bd2kccd.github.io/docs/causal-cmd/)                                          | 1.1.3    | [tetrad_gfci](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-tetrad_gfci-item.md)                      |
| PC [[4]](#4)[[5]](#5)             | CPDAG | R        | [pcalg](https://cran.r-project.org/web/packages/pcalg/index.html)                                          | 2.7-3    | [pcalg_pc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-pcalg_pc-item.md)                            |
| Dual PC [[31]](#31)               | CPDAG | R        | [dualPC](https://github.com/enricogiudice/dualPC)                                                          | 4a5175d  | [dualpc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-dualpc-item.md)                                |
| No tears [[17]](#17)              | DAG   | Python   | [jmoss20/notears](https://github.com/jmoss20/notears)                                                      | #0c032a0 | [notears](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-notears-item.md)                              |
| No tears                          | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_notears](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_notears-item.md)              |
| PC                                | CPDAG | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_pc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_notears-item.md)              |
| ANM                               | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_anm](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_anm-item.md)              |
| Direct LiNGAM                     | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_direct_lingam](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_direct_lingam-item.md)              |
| ICALiNGAM                         | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_ica_lingam](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_ica_lingam-item.md)              |
| NOTEARS-MLP                       | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_notears_nonlinear](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_notears_nonlinear-item.md)              |
| NOTEARS-SOM                       | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_notears_nonlinear](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_notears_nonlinear-item.md)              |
| NOTEARS-LOW-RANK                  | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_notears_low_rank](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_notears_low_rank-item.md)              |
| GOLEM                             | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_golem](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_golem-item.md)              |
| GraNDAG                           | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_grandag](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_grandag-item.md)              |
| MCSL                              | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_mcsl](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_mcsl-item.md)              |
| RL                                | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_rl](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_rl-item.md)              |
| CORL                              | DAG   | Python   | [gCastle](https://github.com/huawei-noah/trustworthyAI/tree/master/gcastle)                                | 1.0.3 | [gcastle_corl](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gcastle_corl-item.md)              |
| HC [[6]](#6)                      | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_hc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_hc-item.md)                        |
| MMHC [[23]](#23)                  | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_mmhc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_mmhc-item.md)                    |
| Inter-IAMB [[27]](#27)            | CPDAG | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_interiamb](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_interiamb-item.md)          |
| GS [[26]](#26)                    | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_gs](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_gs-item.md)                        |
| Tabu [[25]](#25)                  | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_tabu](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_tabu-item.md)                    |
| PC stable [[4]](#4)[[5]](#5)      | CPDAG | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_pcstable](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_pcstable-item.md)            |
| IAMB [[27]](#27)                  | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_iamb](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_iamb-item.md)                    |
| Fast IAMB                         | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_fastiamb](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_fastiamb-item.md)            |
| IAMB FDR                          | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_iambfdr](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_iambfdr-item.md)              |
| MMPC                              | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_mmpc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_mmpc-item.md)                    |
| SI HITON-PC                       | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_sihitonpc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_sihitonpc-item.md)          |
| Hybrid PC                         | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_hpc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_hpc-item.md)                      |
| H2PC                              | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_h2pc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_h2pc-item.md)                    |
| RSMAX2                            | DAG   | R        | [bnlearn](https://www.bnlearn.com/)                                                                        | 4.7      | [bnlearn_rsmax2](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bnlearn_rsmax2-item.md)                |
| Iterative MCMC [[28]](#28)        | DAG   | R        | [BiDAG](https://cran.r-project.org/web/packages/BiDAG/index.html)                                          | 2.0.3    | [bidag_itsearch](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bidag_itsearch-item.md)                |
| Order MCMC [[28]](#28)[[29]](#29) | DAG   | R        | [BiDAG](https://cran.r-project.org/web/packages/BiDAG/index.html)                                          | 2.0.3    | [bidag_order_mcmc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bidag_order_mcmc-item.md)            |
| Partition MCMC [[30]](#30)        | DAG   | R        | [BiDAG](https://cran.r-project.org/web/packages/BiDAG/index.html)                                          | 2.0.3    | [bidag_partition_mcmc](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-bidag_partition_mcmc-item.md)    |
| PGibbs [[20]](#20)                | DG    | Python   | [trilearn](https://github.com/felixleopoldo/trilearn)                                                      | 1.25    | [trilearn_pgibbs](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-trilearn_pgibbs-item.md)              |
| GG99 single pair [[18]](#18)      | DG    | Java     | [A. Thomas](https://faculty.utah.edu/u0034995-ALUN_WILLIAM_THOMAS/research/index.hml)                      | -        | [gg99_singlepair](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gg99_singlepair-item.md)              |
| GT13 multi pair [[19]](#19)       | DG    | Java     | [A. Thomas](https://faculty.utah.edu/u0034995-ALUN_WILLIAM_THOMAS/research/index.hml)                      | -        | [gt13_multipair](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-gt13_multipair-item.md)                |
| Parallel DG [[36]](#36)                     | DG    | Python   | [parallelDG](https://github.com/melmasri/parallelDG)                                                       | 0.8      | [parallelDG](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-paralleldg-item.md)                        |
| GLasso [[31]](#31)                | UG    | Python   | [scikit-learn](https://scikit-learn.org/stable/modules/generated/sklearn.covariance.graphical_lasso.html)  | 0.22.1   | [sklearn_glasso](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-sklearn_glasso-item.md)                |


#### Evaluation modules

| Function                                  | Language | Library                                                                | Module id                                                                                                                                                                                     |
|-------------------------------------------|----------|------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Plot data with ggpairs                    | R        | [GGally](https://cran.r-project.org/web/packages/GGally/index.html)    | [ggally_ggpairs](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md)        |
| Plot true graphs                          | -        | [graphviz](https://graphviz.org/)                                      | [graph_true_plots](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md)    |
| Plot true graphs properties               | R        | [ggplot2](https://ggplot2.tidyverse.org/)                              | [graph_true_stats](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md)    |
| Plot estimated graphs                     | -        | [graphviz](https://graphviz.org/)                                      | [graph_plots](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-properties-benchmark_setup-properties-evaluation-properties-graph_plots.md)              |
| Timing and ROC curves for TPR,FPR,FNR,... | R        | [ggplot2](https://ggplot2.tidyverse.org/)                              | [benchmarks](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-benchmarks-item.md)                                                           |
| MCMC mean graph                           | Python   | [seaborn](https://seaborn.pydata.org/)                                 | [mcmc_heatmaps](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-mcmc-mean-graph-plot.md)                                                   |
| MCMC auto-correlation                     | Python   | [pandas](https://pandas.pydata.org/)                                   | [mcmc_autocorr_plots](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-mcmc_autocorr_plots-item.md)                                         |
| MCMC trajectory                           | Python   | [pandas](https://pandas.pydata.org/)                                   | [mcmc_traj_plots](https://github.com/felixleopoldo/benchpress/blob/master/docs/source/json_schema/config-definitions-mcmc_traj_plots-item.md)                                                 |

Acronyms are used for Directed Acyclic Graphs (DAGs), Undirected Graphs (UGs), Decomposable Graphs (DGs), and Completed Partially DAGs (CPDAGs).

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

## Contact

Send an email to felix leopoldo rios at gmail com for questions.

## Contributing
Contrubutions are very welcomed. See [CONTRIBUTING.md](CONTRIBUTING.md) for instructions. 

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Open a pull request

## License

This project is licensed under the GPL-2.0 License - see the [LICENSE](LICENSE) file for details

</content>
  <tabTrigger></tabTrigger>
</snippet>


## References
* <a id="1">[1]</a> [Felix L. Rios and Giusi Moffa and Jack Kuipers Benchpress: a scalable and versatile workflow for benchmarking structure learning algorithms for graphical models. *ArXiv eprints.*, 2107.03863, 2021.](https://arxiv.org/abs/2107.03863)
* <a id="2">[2]</a> [Dawid AP, Lauritzen SL (1993). “Hyper Markov laws in the statistical analysis of decomposable graphical models.” The Annals of Statistics, 21(3), 1272–1317.](https://projecteuclid.org/journals/annals-of-statistics/volume-21/issue-3/Hyper-Markov-Laws-in-the-Statistical-Analysis-of-Decomposable-Graphical/10.1214/aos/1176349260.full) 
* <a id="3">[3]</a> [Cussens J (2012). “Bayesian network learning with cutting planes.” arXiv preprint arXiv:1202.3713.](https://arxiv.org/abs/1202.3713)
* <a id="4">[4]</a> [Spirtes P, Glymour CN (1991). “An algorithm for fast recovery of sparse causal graphs.” Social science computer review, 9(1), 62–72.](https://cse.sc.edu/~mgv/csce582sp14/presentations/SpirtesGlymourPC.pdf)
* <a id="5">[5]</a> [Spirtes P, Glymour CN, Scheines R, Heckerman D (2000). Causation, prediction, and search. MIT press.](https://philarchive.org/archive/SPICPA-2)
* <a id="6">[6]</a> [Russell S, Norvig P (2002). “Artificial intelligence: a modern approach.”](https://www.sti-innsbruck.at/sites/default/files/Knowledge-Representation-Search-and-Rules/Russel-&-Norvig-Inference-and-Logic-Sections-7.pdf)
* <a id="7">[7]</a> [Scutari M, Vitolo C, Tucker A (2019b). “Learning Bayesian networks from big data with greedy search: computational complexity and efficient implementation.” Statistics and Computing, 29(5), 1095–1108.](https://link.springer.com/article/10.1007/s11222-019-09857-1)
* <a id="8">[8]</a> [Colombo D, Maathuis MH, Kalisch M, Richardson TS (2012). “Learning high-dimensional directed acyclic graphs with latent and selection variables.” The Annals of Statistics, pp. 294–321.](https://www.jstor.org/stable/pdf/41713636.pdf?casa_token=rpMn5YYYjZcAAAAA:ACAY0o3Fu4oakJ5CAEnsETe0Z-brxM7agz6NfS4MQc5BGYtkQjvBoG8pLQbOYEMhn0eYwcpKCJovhWyqnmMBDwV6Hyke91eqACHAh8UkXbERmCB9)
* <a id="9">[9]</a> [Meek C (1997). Graphical Models: Selecting causal and statistical models. Ph.D. thesis, PhD thesis, Carnegie Mellon University.]
* <a id="10">[10]</a> [Chickering DM (2002). “Optimal structure identification with greedy search.” Journal of machine learning research, 3(Nov), 507–554.](https://www.jmlr.org/papers/volume3/chickering02b/chickering02b.pdf)
* <a id="11">[11]</a> [Ogarrio JM, Spirtes P, Ramsey J (2016). “A hybrid causal search algorithm for latent variable models.” In Conference on Probabilistic Graphical Models, pp. 368–379.](http://proceedings.mlr.press/v52/ogarrio16.html)
* <a id="12">[12]</a> [J. Kuipers, P. Suter, and G. Moffa. Efficient sampling and structure learning of Bayesian networks. Journal of Computational and Graphical Statistics, 0(ja):1–32, 2021.](https://www.tandfonline.com/doi/pdf/10.1080/10618600.2021.2020127)
* <a id="13">[13]</a> [Margaritis D (2003). “Learning Bayesian network model structure from data.” PHD thesis, Carnegie-Mellon Univ Pittsburgh Pa School of Computer Science.](https://www.cs.cmu.edu/~dmarg/Papers/PhD-Thesis-Margaritis.pdf)
* <a id="14">[14]</a> [Tsamardinos I, Aliferis CF, Statnikov AR, Statnikov E (2003). “Algorithms for large scale Markov blanket discovery.” In FLAIRS conference, volume 2, pp. 376–380.](https://www.aaai.org/Papers/FLAIRS/2003/Flairs03-073.pdf)
* <a id="15">[15]</a> [Tsamardinos I, Brown LE, Aliferis CF (2006). “The max-min hill-climbing Bayesian network structure learning algorithm.” Machine learning, 65(1), 31–78.](https://link.springer.com/article/10.1007/s10994-006-6889-7)
* <a id="16">[16]</a> [Scanagatta M, de Campos CP, Corani G, Zaffalon M (2015). “Learning Bayesian networks with thousands of variables.” In Advances in neural information processing systems, pp. 1864–1872.](https://papers.nips.cc/paper/2015/hash/2b38c2df6a49b97f706ec9148ce48d86-Abstract.html)
* <a id="17">[17]</a> [Zheng X, Aragam B, Ravikumar PK, Xing EP (2018). “DAGs with NO TEARS: Continuous optimization for structure learning.” In Advances in Neural Information Processing Systems, pp. 9472–9483.](https://proceedings.neurips.cc/paper/2018/file/e347c51419ffb23ca3fd5050202f9c3d-Paper.pdf)
* <a id="18">[18]</a> [P. Giudici and P. J. Green. Decomposable graphical Gaussian model determination. Biometrika, 86(4):785–801, 1999.](https://www.jstor.org/stable/2673585)
* <a id="19">[19]</a> [P. J. Green and A. Thomas. Sampling decomposable graphs using a Markov chain on junction trees. Biometrika, 100(1):91–110, 2013.](https://www.jstor.org/stable/43304539)
* <a id="20">[20]</a> [J. Olsson, T. Pavlenko, and F. L. Rios. Bayesian learning of weakly structural Markov graph laws using sequential Monte Carlo methods. Electron. J. Statist., 13(2):2865–2897, 2019.](https://projecteuclid.org/journals/electronic-journal-of-statistics/volume-13/issue-2/Bayesian-learning-of-weakly-structural-Markov-graph-laws-using-sequential/10.1214/19-EJS1585.full)
* <a id="21">[21]</a> [J. M. Ogarrio, P. Spirtes, and J. Ramsey. A hybrid causal search algorithm for latent variable models. In Conference on Probabilistic Graphical Models, pages 368–379, 2016.](http://proceedings.mlr.press/v52/ogarrio16.html)
* <a id="22">[22]</a> [D. Colombo, M. H. Maathuis, M. Kalisch, and T. S. Richardson. Learning high-dimensional directed acyclic graphs with latent and selection variables. The Annals of Statistics, pages 294–321, 2012.](https://www.jstor.org/stable/41713636)
* <a id="23">[23]</a> [I. Tsamardinos, L. E. Brown, and C. F. Aliferis. The max-min hill-climbing Bayesian network structure learning algorithm. Machine learning, 65(1):31–78, 2006.](https://link.springer.com/article/10.1007/s10994-006-6889-7)
* <a id="24">[24]</a> [J. Olsson, T. Pavlenko, and F. L. Rios. Sequential sampling of junction trees for decomposable graphs. Statistics and Computing (to appear).](https://arxiv.org/abs/1806.00584)
* <a id="25">[25]</a> [S. Russell and P. Norvig. Artificial intelligence: a modern approach. 2002.](https://www.bokus.com/bok/9781292401133/artificial-intelligence-a-modern-approach-global-edition/)
* <a id="26">[26]</a> [D. Margaritis. Learning Bayesian network model structure from data. Technical report, Carnegie-Mellon Univ Pittsburgh Pa School of Computer Science, 2003.](https://www.amazon.com/Artificial-Intelligence-A-Modern-Approach/dp/0134610997)
* <a id="27">[27]</a> [I. Tsamardinos, C. F. Aliferis, A. R. Statnikov, and E. Statnikov. Algorithms for large scale Markov blanket discovery. In FLAIRS conference, volume 2, pages 376–380, 2003.](https://www.aaai.org/Papers/FLAIRS/2003/Flairs03-073.pdf)
* <a id="29">[29]</a> [Friedman and D. Koller. Being Bayesian about network structure. A Bayesian approach to structure discovery in Bayesian networks. Machine Learning, 50(1):95–125, Jan 2003.](https://link.springer.com/article/10.1023/A:1020249912095)
* <a id="30">[30]</a> [J. Kuipers and G. Moffa. Partition MCMC for inference on acyclic digraphs. Journal of the American Statistical Association, 112(517):282–299, 2017.](https://www.tandfonline.com/doi/abs/10.1080/01621459.2015.1133426?journalCode=uasa20)
* <a id="31">[31]</a> [Jerome Friedman, Trevor Hastie, Robert Tibshirani, Sparse inverse covariance estimation with the graphical lasso, Biostatistics, Volume 9, Issue 3, July 2008, Pages 432–441.](https://pubmed.ncbi.nlm.nih.gov/18079126/)
* <a id="32">[32]</a> [E. Giudice, J. Kuipers, and G. Moffa. The dual pc algorithm for structure learning. arXiv preprint arXiv:2112.09036, 2021.](https://arxiv.org/abs/2112.09036#:~:text=While%20learning%20the%20graphical%20structure,due%20to%20its%20computational%20complexity.)
* <a id="33">[33]</a> [M. Bartlett and J. Cussens. Integer linear programming for the bayesian network structure learning problem. Artificial Intelligence, 244:258–271, 2017. Combining Constraint Solving with Mining and Learning](https://www.jair.org/index.php/jair/article/download/11041/26213/)
* <a id="34">[34]</a> [J. Cussens, M. Järvisalo, J. H. Korhonen, and M. Bartlett. Bayesian network structure learning with integer programming: Polytopes, facets and complexity. Journal of Artificial Intelligence Research, 58:185–229, 2017](https://www.jair.org/index.php/jair/article/download/11041/26213/)
* <a id="35">[35]</a> [Chandler Squires. causaldag: creation, manipulation, and learning of causal models, 2018](https://uhlerlab.github.io/causaldag/)
* <a id="36">[36]</a> [M. Elmasri. Parallel sampling of decomposable graphs using Markov chain on junction trees, 2022.](https://arxiv.org/abs/2209.02008)


