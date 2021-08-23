# Evaluation methods Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## evaluation Type

unknown ([Evaluation methods](config-properties-benchmark_setup-properties-evaluation-methods.md))

# evaluation Properties

| Property                                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                     |
| :------------------------------------------ | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [roc](#roc)                                 | `object`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-roc-item.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc")                                                                                    |
| [adjmat_true_plots](#adjmat_true_plots)     | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-adjmat_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots")     |
| [graph_true_plots](#graph_true_plots)       | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")       |
| [adjmat_plots](#adjmat_plots)               | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-adjmat_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots")               |
| [graph_plots](#graph_plots)                 | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")                 |
| [mcmc_traj_plots](#mcmc_traj_plots)         | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")         |
| [mcmc_heatmaps](#mcmc_heatmaps)             | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")             |
| [mcmc_autocorr_plots](#mcmc_autocorr_plots) | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots") |

## roc

ROC item

`roc`

*   is required

*   Type: `object` ([roc item](config-definitions-roc-item.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-roc-item.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc")

### roc Type

`object` ([roc item](config-definitions-roc-item.md))

## adjmat_true_plots

Plots the adjacency matrices of the true graphs.

`adjmat_true_plots`

*   is required

*   Type: `boolean` ([adjmat_true_plots](config-properties-benchmark_setup-properties-evaluation-methods-properties-adjmat_true_plots.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-adjmat_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots")

### adjmat_true_plots Type

`boolean` ([adjmat_true_plots](config-properties-benchmark_setup-properties-evaluation-methods-properties-adjmat_true_plots.md))

## graph_true_plots

Plots the true graphs.

`graph_true_plots`

*   is required

*   Type: `boolean` ([graph_true_plots](config-properties-benchmark_setup-properties-evaluation-methods-properties-graph_true_plots.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")

### graph_true_plots Type

`boolean` ([graph_true_plots](config-properties-benchmark_setup-properties-evaluation-methods-properties-graph_true_plots.md))

## adjmat_plots

Plots the adjacency matrices of the estimated graphs.

`adjmat_plots`

*   is required

*   Type: `string[]`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-adjmat_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots")

### adjmat_plots Type

`string[]`

## graph_plots

Plots the estimated graphs

`graph_plots`

*   is required

*   Type: `string[]`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")

### graph_plots Type

`string[]`

## mcmc_traj_plots

Plots the functional value of each graph in a MCMC trajctory.

`mcmc_traj_plots`

*   is required

*   Type: `object[]` ([mcmc_traj_plots item](config-definitions-mcmc_traj_plots-item.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")

### mcmc_traj_plots Type

`object[]` ([mcmc_traj_plots item](config-definitions-mcmc_traj_plots-item.md))

## mcmc_heatmaps

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

`mcmc_heatmaps`

*   is required

*   Type: unknown\[] ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")

### mcmc_heatmaps Type

unknown\[] ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

## mcmc_autocorr_plots

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

`mcmc_autocorr_plots`

*   is required

*   Type: unknown\[]

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-evaluation-methods-properties-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots")

### mcmc_autocorr_plots Type

unknown\[]
