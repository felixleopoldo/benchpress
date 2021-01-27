<snippet>
  <content><![CDATA[
# ${1:Systematic benchmarks of structure learning algorithms for graphical models}

[![Snakemake](https://img.shields.io/badge/snakemake-≥5.2.0-brightgreen.svg)](https://snakemake.bitbucket.io)
[![Documentation Status](https://readthedocs.org/projects/benchpressx/badge/?version=latest)](https://benchpressx.readthedocs.io/en/latest/?badge=latest)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

#  
# Benchpress

![Benchpress](images/benchpress.jpg)

A [Snakemake](https://snakemake.readthedocs.io/en/stable/) workflow for flexible and reproducible benchmarks of structure learning algorithms for graphical models.
The documentation is found here https://benchpressx.readthedocs.io.

## Reqirements
- [Snakemake](https://snakemake.readthedocs.io/en/stable/) ([installation instructions](https://docs.docker.com/engine/install/))
- [Docker](https://www.docker.com/) ([installation instructions](https://docs.docker.com/engine/install/))
- [Singularity](https://sylabs.io/guides/3.6/admin-guide/installation.html) ([installation instructions](https://sylabs.io/guides/3.6/admin-guide/installation.html))
- Linux/Unix (Singularity currently only has a Beta release for OSX which is not enough)
## Installation

### Cloning the repository

`$ git clone https://github.com/felixleopoldo/benchpress.git && cd benchpress && pip install -r requirements.txt`

#### Notes
On some systems, you might also have to explicitly install squash-tools. This can be done using conda as

`$ conda install -c conda-forge squash-tools`

## Usage

To run the simulation setup in config.json type

`$ snakemake roc --cores 20 --use-singularity --configfile config/config.sample.docs.json`

A roc curve defined by [config/config.sample.docs.json](config/config.sample.docs.json) is found in the file [results/ROC.eps]() and can be viewed with e.g. evince as

`$ evince results/ROC.eps`

![ROC](docs/source/_static/ROC.png)

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