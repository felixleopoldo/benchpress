<snippet>
  <content><![CDATA[
# ${1:Systematic benchmarks of structure learning algorithms for graphical models}


#  
# Benchpress

![Benchpress](figures/benchpress.jpg)

Systematic benchmarks of structure learning algorithms for graphical models.

## Reqirements
- Snakemake https://snakemake.readthedocs.io/en/stable/
- Docker https://www.docker.com/
- Singularity https://sylabs.io/guides/3.6/admin-guide/installation.html
- Linux/Unix or Windows (Singularity is currently not fully supporting OSX)
## Installation



### Cloning the BenchPress repository

`git clone git@github.com:felixleopoldo/benchpress.git && cd benchpress`

Copy the simulation setup in config.json.sample to config.json 

`$ cp config.sample.json config.json`

#### Notes
On some systems, you might also have to explicitly install squash-tools. This can be done using conda as

`$ conda install -c conda-forge squash-tools`
## Usage

To run the simulation setup in config.json type

`$ snakemake roc --cores 20 --use-singularity`


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

]]></content>
  <tabTrigger>readme</tabTrigger>
</snippet>