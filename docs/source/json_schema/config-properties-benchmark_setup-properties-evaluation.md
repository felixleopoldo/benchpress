# evaluation Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation
```

This section contains the available evaluation methods.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## evaluation Type

unknown ([evaluation](config-properties-benchmark_setup-properties-evaluation.md))

# evaluation Properties

| Property                                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                             |
| :-------------------------------------------- | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [benchmarks](#benchmarks)                     | `object`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-benchmarks-item.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/benchmarks")              |
| [graph\_true\_plots](#graph_true_plots)       | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")       |
| [graph\_true\_stats](#graph_true_stats)       | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_stats")       |
| [ggally\_ggpairs](#ggally_ggpairs)            | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/ggally_ggpairs")           |
| [graph\_plots](#graph_plots)                  | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")                 |
| [mcmc\_traj\_plots](#mcmc_traj_plots)         | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")         |
| [mcmc\_heatmaps](#mcmc_heatmaps)              | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")             |
| [mcmc\_autocorr\_plots](#mcmc_autocorr_plots) | `array`   | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots") |

## benchmarks

ROC item

`benchmarks`

*   is required

*   Type: `object` ([benchmarks item](config-properties-benchmark_setup-properties-evaluation-properties-benchmarks-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-benchmarks-item.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/benchmarks")

### benchmarks Type

`object` ([benchmarks item](config-properties-benchmark_setup-properties-evaluation-properties-benchmarks-item.md))

### benchmarks Examples

```json
{
  "filename_prefix": "example/",
  "point": true,
  "show_seed": true,
  "errorbar": true,
  "errorbarh": false,
  "xrange": [
    0,
    1
  ],
  "yrange": [
    0,
    1
  ],
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

## graph\_true\_plots

This module plots the true underlying graphs. The figures are saved in results/adjmat and copied to results/output/graph\_true\_plots/.

`graph_true_plots`

*   is required

*   Type: `boolean` ([graph\_true\_plots](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")

### graph\_true\_plots Type

`boolean` ([graph\_true\_plots](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_plots.md))

### graph\_true\_plots Examples

```json
{
  "graph_true_plots": true
}
```

## graph\_true\_stats

This module plots statistics of the true underlying graphs. The figures are saved in to results/output/graph\_true\_stats/.

`graph_true_stats`

*   is required

*   Type: `boolean` ([graph\_true\_stats](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_stats")

### graph\_true\_stats Type

`boolean` ([graph\_true\_stats](config-properties-benchmark_setup-properties-evaluation-properties-graph_true_stats.md))

### graph\_true\_stats Examples

```json
{
  "graph_true_stats": true
}
```

## ggally\_ggpairs

This module plots the data using pairs. The figures are saved in to results/output/ggally\_ggpairs/.

`ggally_ggpairs`

*   is optional

*   Type: `boolean` ([ggally\_ggpairs](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/ggally_ggpairs")

### ggally\_ggpairs Type

`boolean` ([ggally\_ggpairs](config-properties-benchmark_setup-properties-evaluation-properties-ggally_ggpairs.md))

### ggally\_ggpairs Examples

```json
{
  "ggally_ggpairs": true
}
```

## graph\_plots

This module plots and saves the estimated graphs in dot-format. The figures are saved in results/adjmat and copied to results/output/graph\_plots/.

`graph_plots`

*   is required

*   Type: `string[]`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")

### graph\_plots Type

`string[]`

### graph\_plots Examples

```json
[
  "fges-sem-bic",
  "mmhc-bge-zf",
  "omcmc_itsample-bge",
  "pc-gaussCItest"
]
```

## mcmc\_traj\_plots

This module plots the so called score values in the trajectory or the value of a given functional. The currently supported functionals are the number of edges for the graphs (size) and the graph score. The mcmc\_traj\_plots module has a list of objects, where each object has an id field for the algorithm object id, a burn-in field (burn\_in) and a field specifying the functional to be considered (functional). Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the thinning field. The plots are saved in results/mcmc\_traj\_plots/ and copied to results/output/mcmc\_traj\_plots/.

`mcmc_traj_plots`

*   is required

*   Type: `object[]` ([mcmc\_traj\_plots item](config-definitions-mcmc_traj_plots-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")

### mcmc\_traj\_plots Type

`object[]` ([mcmc\_traj\_plots item](config-definitions-mcmc_traj_plots-item.md))

### mcmc\_traj\_plots Examples

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

## mcmc\_heatmaps

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

`mcmc_heatmaps`

*   is required

*   Type: unknown\[] ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")

### mcmc\_heatmaps Type

unknown\[] ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

### mcmc\_heatmaps Examples

```json
[
  {
    "id": "omcmc_itsample-bge",
    "burn_in": 0,
    "active": true
  }
]
```

## mcmc\_autocorr\_plots

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

`mcmc_autocorr_plots`

*   is required

*   Type: unknown\[] ([mcmc\_autocorr\_plots item](config-definitions-mcmc_autocorr_plots-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation-properties-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots")

### mcmc\_autocorr\_plots Type

unknown\[] ([mcmc\_autocorr\_plots item](config-definitions-mcmc_autocorr_plots-item.md))

### mcmc\_autocorr\_plots Examples

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
