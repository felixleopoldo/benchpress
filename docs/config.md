# JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                             |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ---------------------------------------------------------------------- |
| Can be instantiated | Yes        | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json](../out/config.schema.json "open original schema") |

## JSON schema for BenchPress config file. Type

`object` ([JSON schema for BenchPress config file.](config.md))

# JSON schema for BenchPress config file. Properties

| Property                                                          | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                |
| :---------------------------------------------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [output_dir](#output_dir)                                         | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-output_dir.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/output_dir")                                         |
| [benchmark_setup](#benchmark_setup)                               | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup")                               |
| [data_sampling_algorithms](#data_sampling_algorithms)             | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-data_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/data_sampling_algorithms")             |
| [graph_sampling_algorithms](#graph_sampling_algorithms)           | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-graph_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/graph_sampling_algorithms")           |
| [parameters_sampling_algorithms](#parameters_sampling_algorithms) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-parameters_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/parameters_sampling_algorithms") |
| [evaluation](#evaluation)                                         | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-evaluation.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/evaluation")                                         |
| [structure_learning_algorithms](#structure_learning_algorithms)   | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-structure_learning_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/structure_learning_algorithms")   |

## output_dir

Directory for the generated files.


`output_dir`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-output_dir.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/output_dir")

### output_dir Type

`string`

## benchmark_setup

Description of the benchmarking setup.


`benchmark_setup`

-   is required
-   Type: `object` ([Details](config-properties-benchmark_setup.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup")

### benchmark_setup Type

`object` ([Details](config-properties-benchmark_setup.md))

## data_sampling_algorithms

Data sampling setup.


`data_sampling_algorithms`

-   is optional
-   Type: `object` ([Details](config-properties-data_sampling_algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/data_sampling_algorithms")

### data_sampling_algorithms Type

`object` ([Details](config-properties-data_sampling_algorithms.md))

## graph_sampling_algorithms

The graph samplings algorithms.


`graph_sampling_algorithms`

-   is required
-   Type: `object` ([Details](config-properties-graph_sampling_algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-graph_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/graph_sampling_algorithms")

### graph_sampling_algorithms Type

`object` ([Details](config-properties-graph_sampling_algorithms.md))

## parameters_sampling_algorithms

The parameter sampling algorithms


`parameters_sampling_algorithms`

-   is required
-   Type: `object` ([Details](config-properties-parameters_sampling_algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-parameters_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/parameters_sampling_algorithms")

### parameters_sampling_algorithms Type

`object` ([Details](config-properties-parameters_sampling_algorithms.md))

## evaluation

Setup for the evaluation procedure.


`evaluation`

-   is required
-   Type: `object` ([Details](config-properties-evaluation.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-evaluation.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/evaluation")

### evaluation Type

`object` ([Details](config-properties-evaluation.md))

## structure_learning_algorithms

The structure learning algorithms


`structure_learning_algorithms`

-   is required
-   Type: `object` ([Details](config-properties-structure_learning_algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-structure_learning_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/structure_learning_algorithms")

### structure_learning_algorithms Type

`object` ([Details](config-properties-structure_learning_algorithms.md))

# JSON schema for BenchPress config file. Definitions

## Definitions group fixed_data_dict

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/fixed_data_dict"}
```

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                      |
| :-------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [graph](#graph) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fixed_data_dict-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fixed_data_dict/properties/graph") |
| [data](#data)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fixed_data_dict-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fixed_data_dict/properties/data")   |

### graph




`graph`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fixed_data_dict-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fixed_data_dict/properties/graph")

#### graph Type

`string`

### data




`data`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fixed_data_dict-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fixed_data_dict/properties/data")

#### data Type

`string`

## Definitions group sampled_model_dict

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict"}
```

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                      |
| :------------------------ | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [graph](#graph)           | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/graph")           |
| [parameters](#parameters) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-parameters.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/parameters") |
| [data](#data)             | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/data")             |
| [replicates](#replicates) | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-replicates.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/replicates") |

### graph




`graph`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/graph")

#### graph Type

`string`

### parameters




`parameters`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-parameters.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/parameters")

#### parameters Type

`string`

### data




`data`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/data")

#### data Type

`string`

### replicates




`replicates`

-   is optional
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-sampled_model_dict-properties-replicates.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/sampled_model_dict/properties/replicates")

#### replicates Type

`integer[]`

## Definitions group standard_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling"}
```

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :---------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/id")                     |
| [sample_sizes](#sample_sizes) | `array`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-sample_sizes.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/sample_sizes") |

### id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/id")

#### id Type

`string`

### sample_sizes

Sample sizes in simulation setup arranged in a list of list of sample sizes.


`sample_sizes`

-   is required
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-sample_sizes.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/sample_sizes")

#### sample_sizes Type

`integer[]`

## Definitions group generateDAGMaxParents

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents"}
```

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :---------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)               | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/id")               |
| [av_parent](#av_parent) | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-av_parent.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/av_parent") |
| [dims](#dims)           | `array`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-dims.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/dims")           |

### id




`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/id")

#### id Type

`string`

### av_parent

Maximum average number of parents


`av_parent`

-   is optional
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-av_parent.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/av_parent")

#### av_parent Type

`integer[]`

### dims

Dimensions of the DAGs, a list of list of dimensions, matching the sample_sizes in the data setup.


`dims`

-   is required
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-dims.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/dims")

#### dims Type

`integer[]`

## Definitions group generateBinaryBN

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN"}
```

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                    |
| :---------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/id")   |
| [min](#min) | `number` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-min.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/min") |
| [max](#max) | `number` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-max.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/max") |

### id




`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/id")

#### id Type

`string`

### min

Minimum probability


`min`

-   is required
-   Type: `number`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-min.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/min")

#### min Type

`number`

#### min Constraints

**maximum**: the value of this number must smaller than or equal to: `1`

**minimum**: the value of this number must greater than or equal to: `0`

### max

Maximum probability


`max`

-   is required
-   Type: `number`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-max.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/max")

#### max Type

`number`

#### max Constraints

**maximum**: the value of this number must smaller than or equal to: `1`

**minimum**: the value of this number must greater than or equal to: `0`

## Definitions group prob

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/prob"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group natnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/natnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group nonnegint

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/nonnegint"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group nonnegnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/nonnegnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexnonnegnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegnumnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexnonnegnumnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegint

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexnonnegint"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegintnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexnonnegintnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnatnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexnatnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnatnumnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexnatnumnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexprob

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexprob"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexprobnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/flexprobnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group trilearn_loglin

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                  |
| :-------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-trilearn_loglin-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-trilearn_loglin-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/alpha")                                     |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/beta")                                      |
| [pseudo_obs](#pseudo_obs)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/pseudo_obs")                           |
| [radii](#radii)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/radii")                                |
| [N](#N)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnatnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/N")                                       |
| [M](#M)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnatnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/M")                                       |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/burnin")                               |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/threshold")                                 |

### id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-trilearn_loglin-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-trilearn_loglin-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### beta




`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/beta")

#### beta Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### pseudo_obs




`pseudo_obs`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/pseudo_obs")

#### pseudo_obs Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### radii




`radii`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/radii")

#### radii Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### N




`N`

-   is required
-   Type: merged type ([Details](config-definitions-flexnatnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnatnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/N")

#### N Type

merged type ([Details](config-definitions-flexnatnum.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnatnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnatnum-anyof-1.md "check type definition")

### M




`M`

-   is required
-   Type: merged type ([Details](config-definitions-flexnatnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnatnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/M")

#### M Type

merged type ([Details](config-definitions-flexnatnum.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnatnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnatnum-anyof-1.md "check type definition")

### burnin




`burnin`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/burnin")

#### burnin Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### threshold




`threshold`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/trilearn_loglin/properties/threshold")

#### threshold Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## Definitions group blip

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/blip"}
```

| Property                        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                |
| :------------------------------ | --------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/id")                       |
| [plot_legend](#plot_legend)     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/plot_legend")     |
| [scorer.method](#scorer.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorer.method")  |
| [solver.method](#solver.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/solver.method")  |
| [indeg](#indeg)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/indeg")                         |
| [time](#time)                   | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/time")                          |
| [allocated](#allocated)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/allocated")                     |
| [scorefunction](#scorefunction) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorefunction") |
| [alpha](#alpha)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/alpha")                              |
| [cores](#cores)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/cores")                         |
| [verbose](#verbose)             | `integer` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-verbose.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/verbose")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/plot_legend")

#### plot_legend Type

`string`

### scorer.method




`scorer.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorer.method")

#### scorer.method Type

`string`

### solver.method




`solver.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/solver.method")

#### solver.method Type

`string`

### indeg




`indeg`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/indeg")

#### indeg Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### time




`time`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/time")

#### time Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### allocated




`allocated`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/allocated")

#### allocated Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### scorefunction




`scorefunction`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorefunction")

#### scorefunction Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### cores




`cores`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/cores")

#### cores Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### verbose

Non-negative integers, (0,1,2,...)


`verbose`

-   is required
-   Type: `integer`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-verbose.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/verbose")

#### verbose Type

`integer`

#### verbose Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## Definitions group notears

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/notears"}
```

| Property                                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                  |
| :-------------------------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/id")                   |
| [plot_legend](#plot_legend)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/plot_legend") |
| [min_rate_of_progress](#min_rate_of_progress) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/min_rate_of_progress")              |
| [penalty_growth_rate](#penalty_growth_rate)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/penalty_growth_rate")          |
| [optimation_accuracy](#optimation_accuracy)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/optimation_accuracy")          |
| [loss](#loss)                                 | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss")               |
| [loss_grad](#loss_grad)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss_grad")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/plot_legend")

#### plot_legend Type

`string`

### min_rate_of_progress




`min_rate_of_progress`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/min_rate_of_progress")

#### min_rate_of_progress Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### penalty_growth_rate




`penalty_growth_rate`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/penalty_growth_rate")

#### penalty_growth_rate Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### optimation_accuracy




`optimation_accuracy`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/optimation_accuracy")

#### optimation_accuracy Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### loss




`loss`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss")

#### loss Type

`string`

#### loss Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value                      | Explanation |
| :------------------------- | ----------- |
| `"least_squares_loss"`     |             |
| `"least_squares_loss_cov"` |             |

### loss_grad




`loss_grad`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss_grad")

#### loss_grad Type

`string`

#### loss_grad Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value                           | Explanation |
| :------------------------------ | ----------- |
| `"least_squares_loss_grad"`     |             |
| `"least_squares_loss_cov_grad"` |             |

## Definitions group gobnilp

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp"}
```

| Property                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                  |
| :-------------------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/id")                   |
| [plot_legend](#plot_legend) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot_legend") |
| [plot](#plot)               | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot")               |
| [palim](#palim)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/palim")                        |
| [alpha](#alpha)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/alpha")                             |
| [prune](#prune)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/prune")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot_legend")

#### plot_legend Type

`string`

### plot




`plot`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot")

#### plot Type

`boolean`

### palim




`palim`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/palim")

#### palim Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### prune




`prune`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/prune")

#### prune Type

`boolean`

## Definitions group greenthomas

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                          |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/plot_legend") |
| [n_samples](#n_samples)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/n_samples")                        |
| [penalty](#penalty)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/penalty")                          |
| [randomits](#randomits)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/randomits")                        |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/plot_legend")

#### plot_legend Type

`string`

### n_samples




`n_samples`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/n_samples")

#### n_samples Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### penalty




`penalty`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/penalty")

#### penalty Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### randomits




`randomits`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/randomits")

#### randomits Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## Definitions group fges

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/fges"}
```

| Property                                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                            |
| :------------------------------------------ | --------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fges-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/id")                                   |
| [plot_legend](#plot_legend)                 | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fges-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/plot_legend")                 |
| [faithfulnessAssumed](#faithfulnessAssumed) | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fges-properties-faithfulnessassumed.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/faithfulnessAssumed") |
| [score](#score)                             | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fges-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/score")                             |
| [data-type](#data-type)                     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fges-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/data-type")                     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fges-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fges-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/plot_legend")

#### plot_legend Type

`string`

### faithfulnessAssumed




`faithfulnessAssumed`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fges-properties-faithfulnessassumed.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/faithfulnessAssumed")

#### faithfulnessAssumed Type

`boolean`

### score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fges-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/score")

#### score Type

`string`

### data-type




`data-type`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fges-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fges/properties/data-type")

#### data-type Type

`string`

## Definitions group fci

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/fci"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                          |
| :-------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/alpha")                         |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/test")               |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/data-type")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/test")

#### test Type

`string`

### data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/fci/properties/data-type")

#### data-type Type

`string`

## Definitions group gfci

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                            |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/alpha")                          |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/test")               |
| [score](#score)             | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/score")             |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/data-type")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/test")

#### test Type

`string`

### score




`score`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/score")

#### score Type

`string`

### data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/data-type")

#### data-type Type

`string`

## Definitions group rfci

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                            |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/alpha")                          |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/test")               |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/data-type")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/test")

#### test Type

`string`

### data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/rfci/properties/data-type")

#### data-type Type

`string`

## Definitions group pcalg

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                              |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pcalg-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pcalg-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg/properties/alpha")                           |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-pcalg-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-pcalg-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/pcalg/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## Definitions group mmhc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc"}
```

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                               |
| :------------------------------ | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mmhc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc/properties/id")                      |
| [plot_legend](#plot_legend)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mmhc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc/properties/plot_legend")    |
| [restrict.args](#restrict.args) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mmhc-properties-restrictargs.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc/properties/restrict.args") |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-mmhc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-mmhc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc/properties/plot_legend")

#### plot_legend Type

`string`

### restrict.args




`restrict.args`

-   is required
-   Type: `object` ([Details](config-definitions-mmhc-properties-restrictargs.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-mmhc-properties-restrictargs.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/mmhc/properties/restrict.args")

#### restrict.args Type

`object` ([Details](config-definitions-mmhc-properties-restrictargs.md))

## Definitions group h2pc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc"}
```

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                               |
| :------------------------------ | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc/properties/id")                      |
| [plot_legend](#plot_legend)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc/properties/plot_legend")    |
| [restrict.args](#restrict.args) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-properties-restrictargs.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc/properties/restrict.args") |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc/properties/plot_legend")

#### plot_legend Type

`string`

### restrict.args




`restrict.args`

-   is required
-   Type: `object` ([Details](config-definitions-h2pc-properties-restrictargs.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-properties-restrictargs.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/h2pc/properties/restrict.args")

#### restrict.args Type

`object` ([Details](config-definitions-h2pc-properties-restrictargs.md))

## Definitions group interiamb

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                      |
| :-------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/alpha")                               |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## Definitions group gs

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/gs"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gs-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gs/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gs-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gs/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gs/properties/alpha")                        |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gs-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gs/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gs-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gs/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gs/properties/alpha")

#### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## Definitions group tabu

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                            |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/plot_legend") |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/beta")                      |
| [score](#score)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/score")             |
| [iss](#iss)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/iss")                       |
| [iss.mu](#iss.mu)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/iss.mu")                    |
| [l](#l)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/l")                         |
| [k](#k)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/k")                         |
| [prior](#prior)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/prior")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/plot_legend")

#### plot_legend Type

`string`

### beta




`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/beta")

#### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/score")

#### score Type

`string`

### iss




`iss`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/iss")

#### iss Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### iss.mu




`iss.mu`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/iss.mu")

#### iss.mu Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### l




`l`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/l")

#### l Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### k




`k`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/k")

#### k Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### prior




`prior`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/tabu/properties/prior")

#### prior Type

`string`

## Definitions group hc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/hc"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/plot_legend") |
| [perturb](#perturb)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/perturb")                 |
| [restart](#restart)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/restart")                 |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/beta")                    |
| [score](#score)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/score")             |
| [iss](#iss)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss")                     |
| [iss.mu](#iss.mu)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss.mu")                  |
| [l](#l)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/l")                       |
| [k](#k)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/k")                       |
| [prior](#prior)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/prior")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/plot_legend")

#### plot_legend Type

`string`

### perturb




`perturb`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/perturb")

#### perturb Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### restart




`restart`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/restart")

#### restart Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### beta




`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/beta")

#### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

### score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/score")

#### score Type

`string`

### iss




`iss`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss")

#### iss Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### iss.mu




`iss.mu`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss.mu")

#### iss.mu Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### l




`l`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/l")

#### l Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### k




`k`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/k")

#### k Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

### prior




`prior`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/prior")

#### prior Type

`string`

## Definitions group itsearch

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                    |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/plot_legend") |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-optional.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional")       |

### id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/plot_legend")

#### plot_legend Type

`string`

### optional

Algorithm parameters to show in plotting


`optional`

-   is optional
-   Type: `object` ([Details](config-definitions-itsearch-properties-optional.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-optional.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional")

#### optional Type

`object` ([Details](config-definitions-itsearch-properties-optional.md))

## Definitions group order_mcmc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/plot_legend") |
| [startspace](#startspace)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/startspace")   |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-optional.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/optional")       |
| [scoretype](#scoretype)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/scoretype")     |
| [chi](#chi)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/chi")                         |
| [edgepf](#edgepf)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/edgepf")                      |
| [am](#am)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/am")                          |
| [aw](#aw)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/aw")                          |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/threshold")                            |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/burnin")                          |

### id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/plot_legend")

#### plot_legend Type

`string`

### startspace




`startspace`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/startspace")

#### startspace Type

`string`

### optional




`optional`

-   is optional
-   Type: `object` ([Details](config-definitions-order_mcmc-properties-optional.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-optional.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/optional")

#### optional Type

`object` ([Details](config-definitions-order_mcmc-properties-optional.md))

### scoretype




`scoretype`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/scoretype")

#### scoretype Type

`string`

### chi




`chi`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/chi")

#### chi Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

### edgepf




`edgepf`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/edgepf")

#### edgepf Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

### am




`am`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/am")

#### am Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

### aw




`aw`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/aw")

#### aw Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

### threshold




`threshold`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/threshold")

#### threshold Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

### burnin




`burnin`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/burnin")

#### burnin Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-0.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")
