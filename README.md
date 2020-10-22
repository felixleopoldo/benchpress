<snippet>
  <content><![CDATA[
# ${1:Systematic benchmarks of structure learning algorithms for graphical models}


#  
# Benchpress


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

Open the file `simresults/ROC.eps`.

![ROC curve](simresults/ROC.eps)

## Example JSON file

```javascript
{
    "output_dir": "simresults",
    "benchmark_setup": {
        "structure_learning_algorithms": [
            "itsearch_map", "order_mcmc_itmap", "blip"
        ],
        "data":[{
                    "graph": "hepar2.csv",
                    "parameters": "generateBinaryBN" ,
                    "data": "standard_sampling",
                    "seed_range": [1, 10]
                }],
        "evaluation": {
            "ROC": [{
                        "structure_learning_algorithm":"blip", 
                        "curve_variable":"time"
                    },
                    {
                        "structure_learning_algorithm":"order_mcmc", 
                        "curve_variable":"threshold"
                    },
                    {
                        "structure_learning_algorithm":"itsearch", 
                        "curve_variable":"plus1it"},
                    {
                        "structure_learning_algorithm":"notears",  
                        "curve_variable":"min_rate_of_progress"}
                    ]
        }
    },
    "data_sampling_algorithms": {
        "standard_sampling":[
            {"id":"standard_sampling",
             "sample_sizes": [100],
             "replicates": {
                "start": 1,
                "end": 1
             }},
             {"id":"standard_sampling2000",
                "sample_sizes": [2000],
                "replicates": {
                   "start": 1,
                   "end": 1
                }}
        ],
        "notears_linear_gaussian_sampling":[
            {
                "id":"standard_linear_gaussian",
                "type":"continuous",
                "sample_sizes":[100],
                "mean":0,
                "variance":1
            }
        ],
        "fixed_data":[
           {"id":"myasiandata.csv",
            "type":"binary",
            "samples":100,
            "filename":"myasiandata.csv",
            "graph":"asia.csv"}
            ,
           {"id":"myhepar2data.csv",
            "type":"categorical",
            "samples":1000,
            "filename":"myhepar2data.csv"
            }
        ],
        "data_dir":[
            {"id":"my_bio_data_dir",
             "directory":"biodata/"}
            ,
            {"id":"mydatadir",
             "directory":"mydata"}
        ]
    },
    "graph_sampling_algorithms": {
        "notears":[{
            "id":"notears",
            "num_nodes":40,
            "num_edges": 80
        }],
        "generateDAGMaxParents": [{
            "id": "generateDAGMaxParents",
            "av_parents": [2],
            "dims": [80]
        }],
        "bn.fit_adjmats" :[{
            "id":"bn.fit_adjmat",
            "sub_directory": "bn.fit_adjmats/"
        }],
        "fixed_adjmats": [
            {"id":"asia.csv",
             "filename":"asia.csv",
             "nodes": 8,
             "edges": 8,
             "average_markov_blanket_size": 2.5,
             "average_degree": 2,
             "maximum_degree": 2,
             "origin":"http://bnlearn.com/bnrepository/discrete-large.html#asia"}
             ,
             {
                "id":"myasia.csv",
                "filename":"myasia.csv",
                "nodes": 8,
                "edges": 8,
                "average_markov_blanket_size": 2.5,
                "average_degree": 2,
                "maximum_degree": 2,
                "origin":"http://bnlearn.com/bnrepository/discrete-large.html#asia"
            }
            ,  
            {"id": "hepar2.csv",
             "filename": "hepar2.csv",
             "origin":"http://bnlearn.com/bnrepository/discrete-large.html#hepar2"}]
    },
    "parameters_sampling_algorithms": {
        "generateBinaryBN":[{
            "id":"generateBinaryBN",
            "min":0.1,
            "max":0.9
        }],
        "bn.fit_networks": [
            {"id":"hepar2.rds",
             "filename": "hepar2.rds",
            "sub_directory":"bn.fit_networks"}
        ],
        "notears":[{
            "id":"notears",
            "edge_coefficient_range_from":0.5,
            "edge_coefficient_range_to":2
        }]
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
        "notears": [{
            "id": "notears",
            "plot_legend": "Notears",
            "min_rate_of_progress": 0.25,
            "penalty_growth_rate": 10,
            "optimation_accuracy": 0.00000001,
            "loss": "least_squares_loss",
            "loss_grad": "least_squares_loss_grad"
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
            "n_samples": 10000,
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
        "itsearch": [
            {
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
            },
            {
                "id": "itsearch_map_cont",
                "plot_legend": "itmap_cont",
                "optional": {
                    "MAP": true,
                    "plus1it": null,
                    "posterior": null,
                    "scoretype": "bge",
                    "chi": null,
                    "edgepf": null,
                    "am":1,
                    "aw":null
                }
            }
            ,
            {
                "id":"itsearch_sample",
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
                "id":"order_mcmc_itmap_cont",
                "plot_legend": "order_mcmc_itmap_cont",
                "startspace": "itsearch_map_cont",
                "optional": {
                    "plus1": true
                },
                "scoretype": "bge",
                "chi": null,
                "edgepf": null,
                "aw":null,
                "am":1,
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