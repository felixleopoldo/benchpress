# Evaluation methods Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## evaluation Type

unknown ([Evaluation methods](config-properties-benchmark-setup-properties-evaluation-methods.md))

# evaluation Properties

| Property                                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                       |
| :------------------------------------------ | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [roc](#roc)                                 | `object`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-roc-item.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc")                                                                                |
| [adjmat_true_plots](#adjmat_true_plots)     | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-adjmat_true_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots") |
| [graph_true_plots](#graph_true_plots)       | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")   |
| [adjmat_plots](#adjmat_plots)               | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-adjmat_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots")           |
| [graph_plots](#graph_plots)                 | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")             |
| [mcmc_traj_plots](#mcmc_traj_plots)         | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")                                                             |
| [mcmc_heatmaps](#mcmc_heatmaps)             | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")                                                                 |
| [mcmc_autocorr_plots](#mcmc_autocorr_plots) | `array`   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots")                                                     |

## roc

ROC item

`roc`

*   is required

*   Type: `object` ([ROC item](config-definitions-roc-item.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-roc-item.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc")

### roc Type

`object` ([ROC item](config-definitions-roc-item.md))

## adjmat_true_plots



`adjmat_true_plots`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-adjmat_true_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots")

### adjmat_true_plots Type

`boolean`

## graph_true_plots



`graph_true_plots`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-graph_true_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots")

### graph_true_plots Type

`boolean`

## adjmat_plots



`adjmat_plots`

*   is required

*   Type: `array`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-adjmat_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots")

### adjmat_plots Type

`array`

## graph_plots



`graph_plots`

*   is required

*   Type: `array`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-graph_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots")

### graph_plots Type

`array`

## mcmc_traj_plots



`mcmc_traj_plots`

*   is required

*   Type: unknown\[]

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots")

### mcmc_traj_plots Type

unknown\[]

## mcmc_heatmaps



`mcmc_heatmaps`

*   is required

*   Type: unknown\[]

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_heatmaps.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps")

### mcmc_heatmaps Type

unknown\[]

## mcmc_autocorr_plots



`mcmc_autocorr_plots`

*   is required

*   Type: unknown\[]

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots")

### mcmc_autocorr_plots Type

unknown\[]
