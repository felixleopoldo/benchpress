# evaluation Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation
```

This section contains the available evaluation methods.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## evaluation Type

unknown ([evaluation](config-properties-benchmark_setup-properties-evaluation.md))

## evaluation Examples

```json
{
  "benchmarks": {
    "filename_prefix": "example/",
    "show_seed": false,
    "errorbar": true,
    "errorbarh": false,
    "scatter": true,
    "path": true,
    "text": false,
    "ids": [
      "fges-sem-bic",
      "mmhc-bge-zf",
      "omcmc_itsample-bge",
      "pc-gaussCItest"
    ]
  },
  "graph_true_plots": true,
  "graph_true_stats": true,
  "graph_plots": [
    "fges-sem-bic",
    "mmhc-bge-zf",
    "omcmc_itsample-bge",
    "pc-gaussCItest"
  ],
  "mcmc_traj_plots": [
    {
      "id": "omcmc_itsample-bge",
      "burn_in": 0,
      "thinning": 1,
      "functional": [
        "score",
        "size"
      ],
      "active": true
    }
  ],
  "mcmc_heatmaps": [
    {
      "id": "omcmc_itsample-bge",
      "burn_in": 0,
      "active": true
    }
  ],
  "mcmc_autocorr_plots": [
    {
      "id": "omcmc_itsample-bge",
      "burn_in": 0,
      "thinning": 1,
      "lags": 50,
      "functional": [
        "score",
        "size"
      ],
      "active": true
    }
  ]
}
```

# evaluation Properties

| Property                                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                             |
| :------------------------------------------ | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [benchmarks](#benchmarks)                   | `object`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/benchmarks")                                                              |
| [graph_true_plots](#graph_true_plots)       | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")       |
| [graph_true_stats](#graph_true_stats)       | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_stats")       |
| [ggally_ggpairs](#ggally_ggpairs)           | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/ggally_ggpairs")           |
| [graph_plots](#graph_plots)                 | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")                 |
| [mcmc_traj_plots](#mcmc_traj_plots)         | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")         |
| [mcmc_heatmaps](#mcmc_heatmaps)             | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")             |
| [mcmc_autocorr_plots](#mcmc_autocorr_plots) | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots") |

## benchmarks

ROC item

`benchmarks`

*   is required

*   Type: `object` ([benchmarks item](config-definitions-benchmarks-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/benchmarks")

### benchmarks Type

`object` ([benchmarks item](config-definitions-benchmarks-item.md))

### benchmarks Examples

```json
{
  "filename_prefix": "example/",
  "point": true,
  "errorbar": true,
  "path": true,
  "text": false,
  "ids": [
    "fges-sem-bic",
    "mmhc-bge-zf",
    "omcmc_itsample-bge",
    "pc-gaussCItest"
  ]
}
```

## graph_true_plots

This module plots the true underlying graphs. The figures are saved in results/adjmat and copied to results/output/graph_true_plots/.

`graph_true_plots`

*   is required

*   Type: `boolean` ([graph_true_plots](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")

### graph_true_plots Type

`boolean` ([graph_true_plots](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md))

### graph_true_plots Examples

```json
{
  "graph_true_plots": true
}
```

## graph_true_stats

This module plots statistics of the true underlying graphs. The figures are saved in to results/output/graph_true_stats/.

`graph_true_stats`

*   is required

*   Type: `boolean` ([graph_true_stats](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_stats")

### graph_true_stats Type

`boolean` ([graph_true_stats](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md))

### graph_true_stats Examples

```json
{
  "graph_true_stats": true
}
```

## ggally_ggpairs

This module plots the data using pairs. The figures are saved in to results/output/ggally_ggpairs/.

`ggally_ggpairs`

*   is optional

*   Type: `boolean` ([ggally_ggpairs](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/ggally_ggpairs")

### ggally_ggpairs Type

`boolean` ([ggally_ggpairs](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md))

### ggally_ggpairs Examples

```json
{
  "ggally_ggpairs": true
}
```

## graph_plots

This module plots and saves the estimated graphs in dot-format. The figures are saved in results/adjmat and copied to results/output/graph_plots/.

`graph_plots`

*   is required

*   Type: `string[]`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")

### graph_plots Type

`string[]`

### graph_plots Examples

```json
[
  "fges-sem-bic",
  "mmhc-bge-zf",
  "omcmc_itsample-bge",
  "pc-gaussCItest"
]
```

## mcmc_traj_plots

This module plots the so called score values in the trajectory or the value of a given functional. The currently supported functionals are the number of edges for the graphs (size) and the graph score. The mcmc_traj_plots module has a list of objects, where each object has an id field for the algorithm object id, a burn-in field (burn_in) and a field specifying the functional to be considered (functional). Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the thinning field. The plots are saved in results/mcmc_traj_plots/ and copied to results/output/mcmc_traj_plots/.

`mcmc_traj_plots`

*   is required

*   Type: `object[]` ([mcmc_traj_plots item](config-definitions-mcmc_traj_plots-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")

### mcmc_traj_plots Type

`object[]` ([mcmc_traj_plots item](config-definitions-mcmc_traj_plots-item.md))

### mcmc_traj_plots Examples

```json
[
  {
    "id": "omcmc_itsample-bge",
    "burn_in": 0,
    "thinning": 1,
    "functional": [
      "score",
      "size"
    ],
    "active": true
  }
]
```

## mcmc_heatmaps

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

`mcmc_heatmaps`

*   is required

*   Type: unknown\[] ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")

### mcmc_heatmaps Type

unknown\[] ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

### mcmc_heatmaps Examples

```json
[
  {
    "id": "omcmc_itsample-bge",
    "burn_in": 0,
    "active": true
  }
]
```

## mcmc_autocorr_plots

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

`mcmc_autocorr_plots`

*   is required

*   Type: unknown\[] ([mcmc_autocorr_plots item](config-definitions-mcmc_autocorr_plots-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots")

### mcmc_autocorr_plots Type

unknown\[] ([mcmc_autocorr_plots item](config-definitions-mcmc_autocorr_plots-item.md))

### mcmc_autocorr_plots Examples

```json
[
  {
    "id": "omcmc_itsample-bge",
    "burn_in": 0,
    "thinning": 1,
    "lags": 50,
    "functional": [
      "score",
      "size"
    ],
    "active": true
  }
]
```
