<snippet>
  <content><![CDATA[
# ${1:Systematic benchmarks of structure learning algorithms for graphical models}

# BenchPress

Systematic benchmarks of structure learning algorithms for graphical models.

## Reqirements
- Snakemake (required) https://snakemake.readthedocs.io/en/stable/
- Docker (strongly recommended) https://www.docker.com/
- Singularity (strongly recommended) https://sylabs.io/docs/

## Installation

### Steps to install and activate Snakemake using conda (from Snakemakes webpage)

`$ conda install -c conda-forge mamba`

`$ mamba create -c conda-forge -c bioconda -n snakemake snakemake`

`$ conda activate snakemake`

If you are using Docker and Singularity (which is strongly recommended) you might also have to install squash-tools

`$ conda install -c conda-forge squash-tools`

### Cloning the BenchPress repository

`git clone git@github.com:felixleopoldo/benchpress.git`

`cd benchpress/benchmark`

Copy the simulation setup in config.json.sample to config.json 

`$ cp config.json.sample config.json`
## Usage

To run the simulation setup in config.json type

`$ snakemake simresults/ROC.eps --cores 20 --use-singularity`

Open the file `simresults/ROC.eps`.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## History

TODO: Write history

## Credits

TODO: Write credits

## License

TODO: Write license
]]></content>
  <tabTrigger>readme</tabTrigger>
</snippet>