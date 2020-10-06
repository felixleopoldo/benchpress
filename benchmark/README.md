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

![ROC curve](simresults/ROC.eps)

## Example JSON file

```javascript
{
    "output_dir": "simresults",
    "plotting": {
        "algorithms": [
         "fci","gfci", "blip", "pcalg", "gobnilp"
        ],
        "models":[{"graph": "generateDAGMaxParents",
                   "parameters": "generateBinaryBN"}],
        "fixed_data":[]
    },
    "data": {
        "replicates": {
            "start": 1,
            "end": 1
        },
        "sample_sizes": [
            [
            100
            ]
        ]
    },
    "graph_sampling_algorithms": {
        "generateDAGMaxParents": {
            "av_parents": [
                [2]
            ],
            "dims": [
                [
                    80
                ]
            ]
        }
    },
    "parameters_sampling_algorithms": {
        "generateBinaryBN":{
            "min":0.1,
            "max":0.9
        }
    },
    "evaluation": {
        "score": {
            "bdecatpar": {
                "chi": 1,
                "edgepf": 1
            }
        }
    },
    "structure_learning_algorithms": {
        "trilearn_loglin": [
            {"id": "trilearn_loglin",
            "plot_legend": "trilearn_loglin",
            "alpha": 0.5,
            "beta": 0.5,
            "radii": 80,
            "N": 50,
            "M": 10,
            "pseudo_obs": 1.0,
            "threshold": [
                0.7,
                0.6
            ],
            "burnin": 0}
            ,
            {"id":"trilearn_loglin05",
                "plot_legend": "trilearn_loglin05",
                "alpha": 0.5,
                "beta": 0.5,
                "radii": 80,
                "N": 50,
                "M": 300,
                "pseudo_obs": 1.0,
                "threshold": 0.5,
                "burnin": 0}
            ],
        "blip": [{
            "id": "blip",
            "plot_legend": "Blip",
            "scorer.method": "is",
            "solver.method": "winasobs",
            "indeg": 80,
            "time": [
                20, 60
            ],
            "allocated": 80,
            "scorefunction": "bdeu",
            "alpha": 1,
            "cores": 1,
            "verbose": 0
            }
        ],
        "gobnilp": 
            [{"id":"gobnilp",
                "plot_legend": "GOBNILP",
                "plot": false,
                "palim": 2,
                "alpha": 1,
                "prune": true            
            }
            ],
        "greenthomas": 
            [{
            "id":"greenthomas",
            "plot_legend": "GreenThomas",                
            "n_samples": 10000000,
            "randomits": 1000,
            "penalty": 0            
            }
            ],
        "fges": [{
                    "id":"fges",
                    "plot_legend": "fGES",
                    "faithfulnessAssumed": true,
                    "score":"bdeu-score",
                    "data-type": "discrete"}
        ],
        "fci": [{
            "id":"fci",
            "plot_legend": "FCI",
            "alpha": [0.01,
                0.05,
                0.1,
                0.2,
                0.35,
                0.45],
            "test":"chi-square-test",
            "data-type": "discrete"}
        ],
        "gfci": [{
            "id":"gfci",
            "plot_legend": "GFCI",
            "alpha": [0.01,
                0.05,
                0.1,
                0.2,
                0.35,
                0.45],
            "score":"bdeu-score",
            "test":"chi-square-test",
            "data-type": "discrete"}
        ],
        "rfci": [{
            "id":"rfci",
            "plot_legend": "rfci",
            "alpha": [0.01,
                0.05,
                0.1,
                0.2,
                0.35,
                0.45],
            "test":"chi-square-test",
            "data-type": "discrete"}
        ],
        "pcalg": [
            {"id":"pcalg",
             "plot_legend": "PC",
             "alpha": [
                    0.01,
                    0.05,
                    0.1,
                    0.2,
                    0.35,
                    0.45
                ]
            },
            {"id":"pcalg005",
             "plot_legend": "pcalg005",
             "alpha": 
                0.05
                }
            ],
        "mmhc": [{
            "id":"mmhc",
            "plot_legend": "MMHC",
            "restrict.args": {
                "alpha": [
                    0.01,
                    0.05,
                    0.1,
                    0.2,
                    0.35,
                    0.45
                ]
            }
        }
        ],
        "h2pc": [{
            "id":"h2pc",
            "plot_legend": "H2PC",
            "restrict.args": {
                "alpha": [
                    0.01,
                    0.05,
                    0.1,
                    0.2,
                    0.35,
                    0.45
                ]
            }
        }
        ],
        "interiamb": [{
            "id":"interiamb",
            "plot_legend": "Inter-IAMB",
            "alpha": [
                    0.01,
                    0.05,
                    0.1,
                    0.2,
                    0.35,
                    0.45
                ]
        }
        ],
        "gs": [{
            "id":"gs",
            "plot_legend": "Grow-Shrink",
            "alpha": [
                    0.01,
                    0.05,
                    0.1,
                    0.2,
                    0.35,
                    0.45
                ]
        }
        ],
        "tabu": [{
            "id":"tabu",
            "plot_legend": "Tabu",
            "score":"bde",
            "iss": 1,
            "iss.mu": 1,                
            "l": 5,
            "k": 1,
            "prior": "uniform",
            "beta": 1
            }
        ],
        "hc": [{
            "id":"hc",
            "plot_legend": "Hill-Climbing",
            "score":"bde",
            "iss": 1,
            "iss.mu": 1,                
            "l": 5,
            "k": 1,
            "prior": "uniform",
            "beta": 1,
            "restart": 0,
            "perturb":1
            }
        ],
        "itsearch": [{
            "id": "itsearch_map",
            "plot_legend": "itmap",
            "optional": {
                "MAP": true,
                "plus1it": null,
                "posterior": null,
                "scoretype": "bdecat",
                "chi": 0.5,
                "edgepf": 2,
                "am":null,
                "aw":null
            }
        }
        ,
        {"id":"itsearch_sample",
        "plot_legend": "itsample",
        "optional": {
            "MAP": false,
            "plus1it": 6,
            "posterior": 0.5,
            "scoretype": "bdecat",
            "chi": 1,
            "edgepf": 1,
            "am":null,
            "aw":null}
            }
        ],
        "order_mcmc": [{
            "id":"order_mcmc_itmap",
            "plot_legend": "order_mcmc_itmap",
            "startspace": "itsearch_map",
            "optional": {
                "plus1": true
            },
            "scoretype": "bdecat",
            "chi": 1,
            "edgepf": 1,
            "aw":null,
            "am":null,
            "threshold": [
                0.99,
                0.95,
                0.9,
                0.8,
                0.7,
                0.6,
                0.5,
                0.4,
                0.3,
                0.2
            ],
            "burnin": 0
            },
            {
                "id":"order_mcmc_itsample",
                "plot_legend": "order_mcmc_itsample",
                "startspace": "itsearch_sample",
                "optional": {
                    "plus1": true
                },
                "scoretype": "bdecat",
                "chi": 1,
                "edgepf": 1,
                "aw":null,
                "am":null,
                "threshold": [
                    0.99,
                    0.95,
                    0.9,
                    0.8,
                    0.7,
                    0.6,
                    0.5,
                    0.4,
                    0.3,
                    0.2
                ],
                "burnin": 0
                }
        ]
    }
}
```


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