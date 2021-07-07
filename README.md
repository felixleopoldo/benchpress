<snippet>
  <content><![CDATA[
# ${1:Systematic benchmarks of structure learning algorithms for graphical models}

[![Snakemake](https://img.shields.io/badge/snakemake-≥5.2.0-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Documentation Status](https://readthedocs.org/projects/benchpressx/badge/?version=latest)](https://benchpressx.readthedocs.io/en/latest/?badge=latest)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

#  
# Benchpress

![Benchpress](images/benchpress.jpg)

Benchpress is a [Snakemake](https://snakemake.readthedocs.io/en/stable/) workflow where structure learning algorithms, implemented in possibly different laguages, can be executed and compared.
The computations scale seamlessly on multiple cores or *"... to server, cluster, grid and cloud environments, without the need to modify the workflow definition" - Snakemake*.
The documentation is found at https://benchpressdocs.readthedocs.io.

The currently supported algorithms are

| Algorithm        | Graph | JSON key          | Language | Library             | Version  |
|------------------|-------|-------------------|----------|---------------------|----------|
| GOBNILP          | DAG   | gobnilp           | C        | GOBNILP (bitbucket) | #e60ef14 |
| ASOBS            | DAG   | rblip_asobs       | R/Java   | r.blip              | 1.1      |
| FGES             | CPDAG | tetrad_fges       | Java     | TETRAD (causal-cmd) | 1.1.3    |
| FCI              | DAG   | tetrad_fci        | Java     | TETRAD (causal-cmd) | 1.1.3    |
| RFCI             | DAG   | tetrad_fci        | Java     | TETRAD (causal-cmd) | 1.1.3    |
| GFCI             | DAG   | tetrad_gfci       | Java     | TETRAD (causal-cmd) | 1.1.3    |
| PC               | CPDAG | pcalg_pc          | R        | pcalg               | 2.6-10   |
| No tears         | DAG   | notears           | Python   | jmoss20 (github)    | #0c032a0 |
| HC               | DAG   | bnlearn_hc        | R        | bnlearn             | 4.5      |
| MMHC             | DAG   | bnlearn_mmhc      | R        | bnlearn             | 4.5      |
| Inter-IAMB       | DAG   | bnlearn_interiamb | R        | bnlearn             | 4.5      |
| GS               | DAG   | bnlearn_gs        | R        | bnlearn             | 4.5      |
| Tabu             | DAG   | bnlearn_gs        | R        | bnlearn             | 4.5      |
| Iterative MCMC   | DAG   | bidag_itsearch    | R        | BiDAG               | 2.0.2    |
| Order MCMC       | DAG   | bidag_order_mcmc  | R        | BiDAG               | 2.0.2    |
| PGibbs           | DG    | trilearn_pgibbs   | Python   | Trilearn            | 1.2.3    |
| GG99 single pair | DG    | gg99_singlepair   | Java     | A. Thomas           | -        |
| GT13 multi pair  | DG    | gt13_multipair    | Java     | A. Thomas           | -        |
| GLasso           | UG    | sklearn_glasso    | Python   | scikit-learn        | 0.22.1   |

## Reqirements
- [Snakemake](https://snakemake.readthedocs.io/en/stable/) ([installation instructions](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html))
- [Docker](https://www.docker.com/) ([installation instructions](https://docs.docker.com/engine/install/))
- [Singularity](https://sylabs.io/docs/) ([installation instructions](https://sylabs.io/guides/3.6/admin-guide/installation.html))
- Linux (Singularity currently only has a Beta release for OSX which is not enough)
## Installation

### Clone and install

`$ git clone https://github.com/felixleopoldo/benchpress.git`

#### Notes
On some systems, you might also have to explicitly install squash-tools. This can be done using conda as

`$ conda install -c conda-forge squash-tools`

## Usage

To run the simulation setup in [config/sec6.1.json](config/sec6.1.json) type

`$ snakemake --cores 20 --use-singularity --configfile config/sec6.1.json`

A roc curve is found in the file [results/output/roc/FPRp_TRP_pattern.eps]() and can be viewed with e.g. evince as

`$ evince results/output/roc/FPRp_TRP_pattern.eps`

![ROC](docs/source/_static/ROC_randbinarybnreps50.png)



## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

This is the first program of its kind.


## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

</content>
  <tabTrigger></tabTrigger>
</snippet>