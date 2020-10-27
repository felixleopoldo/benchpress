# JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------- |
| Can be instantiated | Yes        | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json](../../out/config.schema.json "open original schema") |

## JSON schema for BenchPress config file. Type

`object` ([JSON schema for BenchPress config file.](config.md))

# JSON schema for BenchPress config file. Properties

| Property                                                          | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                    |
| :---------------------------------------------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [output_dir](#output_dir)                                         | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-output-directory.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/output_dir")                                           |
| [benchmark_setup](#benchmark_setup)                               | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup")                                       |
| [data_sampling_algorithms](#data_sampling_algorithms)             | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms")                     |
| [graph_sampling_algorithms](#graph_sampling_algorithms)           | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-graph-sampling-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/graph_sampling_algorithms")                   |
| [parameters_sampling_algorithms](#parameters_sampling_algorithms) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-parameters-sampling-algorithm.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/parameters_sampling_algorithms")          |
| [structure_learning_algorithms](#structure_learning_algorithms)   | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-available-structure-learning-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/structure_learning_algorithms") |

## output_dir

Directory for the generated files.


`output_dir`

-   is required
-   Type: `string` ([Output directory](config-properties-output-directory.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-output-directory.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/output_dir")

### output_dir Type

`string` ([Output directory](config-properties-output-directory.md))

## benchmark_setup

Description of the benchmarking setup.


`benchmark_setup`

-   is required
-   Type: `object` ([Benchmark setup](config-properties-benchmark-setup.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup")

### benchmark_setup Type

`object` ([Benchmark setup](config-properties-benchmark-setup.md))

## data_sampling_algorithms

Data sampling setup.


`data_sampling_algorithms`

-   is optional
-   Type: `object` ([Data sampling algorithms](config-properties-data-sampling-algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms")

### data_sampling_algorithms Type

`object` ([Data sampling algorithms](config-properties-data-sampling-algorithms.md))

## graph_sampling_algorithms

The available graph samplings algorithms.


`graph_sampling_algorithms`

-   is required
-   Type: `object` ([Graph sampling algorithms](config-properties-graph-sampling-algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-graph-sampling-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/graph_sampling_algorithms")

### graph_sampling_algorithms Type

`object` ([Graph sampling algorithms](config-properties-graph-sampling-algorithms.md))

## parameters_sampling_algorithms

The available parameter sampling algorithms


`parameters_sampling_algorithms`

-   is required
-   Type: `object` ([Parameters sampling algorithm](config-properties-parameters-sampling-algorithm.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-parameters-sampling-algorithm.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/parameters_sampling_algorithms")

### parameters_sampling_algorithms Type

`object` ([Parameters sampling algorithm](config-properties-parameters-sampling-algorithm.md))

## structure_learning_algorithms

The available structure learning algorithms


`structure_learning_algorithms`

-   is required
-   Type: `object` ([Available structure learning algorithms](config-properties-available-structure-learning-algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-available-structure-learning-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/structure_learning_algorithms")

### structure_learning_algorithms Type

`object` ([Available structure learning algorithms](config-properties-available-structure-learning-algorithms.md))

# JSON schema for BenchPress config file. Definitions

## Definitions group notears_parameters_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling"}
```

| Property                                                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                            |
| :---------------------------------------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/id")                                           |
| [edge_coefficient_range_from](#edge_coefficient_range_from) | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from") |
| [edge_coefficient_range_to](#edge_coefficient_range_to)     | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to") |

### id




`id`

-   is optional
-   Type: `string` ([ID](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/id")

#### id Type

`string` ([ID](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md))

### edge_coefficient_range_from

Non-negative number


`edge_coefficient_range_from`

-   is optional
-   Type: `number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from")

#### edge_coefficient_range_from Type

`number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md))

#### edge_coefficient_range_from Constraints

**minimum**: the value of this number must greater than or equal to: `0`

### edge_coefficient_range_to

Non-negative number


`edge_coefficient_range_to`

-   is optional
-   Type: `number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to")

#### edge_coefficient_range_to Type

`number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md))

#### edge_coefficient_range_to Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## Definitions group bn.fit_networks

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks"}
```

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                       |
| :-------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-bnfit-network-file-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks/properties/id")         |
| [filename](#filename) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-bnfit-network-file-properties-id-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks/properties/filename") |
| [source](#source)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-bnfit-network-file-properties-source.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks/properties/source") |

### id




`id`

-   is required
-   Type: `string` ([ID](config-definitions-bnfit-network-file-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-bnfit-network-file-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks/properties/id")

#### id Type

`string` ([ID](config-definitions-bnfit-network-file-properties-id.md))

### filename




`filename`

-   is required
-   Type: `string` ([ID](config-definitions-bnfit-network-file-properties-id-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-bnfit-network-file-properties-id-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks/properties/filename")

#### filename Type

`string` ([ID](config-definitions-bnfit-network-file-properties-id-1.md))

### source




`source`

-   is required
-   Type: `string` ([Source](config-definitions-bnfit-network-file-properties-source.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-bnfit-network-file-properties-source.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bn.fit_networks/properties/source")

#### source Type

`string` ([Source](config-definitions-bnfit-network-file-properties-source.md))

## Definitions group notears_linear_gaussian_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling"}
```

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                          |
| :---------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/id")             |
| [sample_sizes](#sample_sizes) | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/sample_sizes")                            |
| [mean](#mean)                 | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-mean.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/mean")         |
| [variance](#variance)         | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-variance.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/variance") |

### id




`id`

-   is optional
-   Type: `string` ([ID](config-definitions-notears-linear-gaussian-sampling-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/id")

#### id Type

`string` ([ID](config-definitions-notears-linear-gaussian-sampling-properties-id.md))

### sample_sizes

Non-negative integers, (0,1,2,...), or array of the same.


`sample_sizes`

-   is optional
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/sample_sizes")

#### sample_sizes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### mean




`mean`

-   is optional
-   Type: `number` ([Mean](config-definitions-notears-linear-gaussian-sampling-properties-mean.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-mean.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/mean")

#### mean Type

`number` ([Mean](config-definitions-notears-linear-gaussian-sampling-properties-mean.md))

### variance




`variance`

-   is optional
-   Type: `number` ([Variance](config-definitions-notears-linear-gaussian-sampling-properties-variance.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-variance.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/variance")

#### variance Type

`number` ([Variance](config-definitions-notears-linear-gaussian-sampling-properties-variance.md))

## Definitions group fixed_data

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data"}
```

| Property              | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :-------------------- | ------------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)             | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/id")                        |
| [filename](#filename) | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-filename.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/filename")       |
| [graph](#graph)       | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-underlying-graph-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/graph")    |
| [source](#source)     | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-source.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/source")           |
| [datatype](#datatype) | Not specified | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/datatype")           |
| [samples](#samples)   | `integer`     | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/samples") |

### id




`id`

-   is optional
-   Type: `string` ([ID](config-definitions-data-file-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/id")

#### id Type

`string` ([ID](config-definitions-data-file-properties-id.md))

### filename




`filename`

-   is optional
-   Type: `string` ([Data filename](config-definitions-data-file-properties-data-filename.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-filename.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/filename")

#### filename Type

`string` ([Data filename](config-definitions-data-file-properties-data-filename.md))

### graph




`graph`

-   is optional
-   Type: `string` ([Underlying graph id](config-definitions-data-file-properties-underlying-graph-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-underlying-graph-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/graph")

#### graph Type

`string` ([Underlying graph id](config-definitions-data-file-properties-underlying-graph-id.md))

### source




`source`

-   is optional
-   Type: `string` ([Data source](config-definitions-data-file-properties-data-source.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-source.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/source")

#### source Type

`string` ([Data source](config-definitions-data-file-properties-data-source.md))

### datatype




`datatype`

-   is optional
-   Type: unknown ([Data type](config-definitions-data-file-properties-data-type.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/datatype")

#### datatype Type

unknown ([Data type](config-definitions-data-file-properties-data-type.md))

#### datatype Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value           | Explanation |
| :-------------- | ----------- |
| `"continuous"`  |             |
| `"binary"`      |             |
| `"categorical"` |             |

### samples

Non-negative integer, 0,1,2,...


`samples`

-   is optional
-   Type: `integer` ([Non-negative integer](config-definitions-data-file-properties-non-negative-integer.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/samples")

#### samples Type

`integer` ([Non-negative integer](config-definitions-data-file-properties-non-negative-integer.md))

#### samples Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## Definitions group fixed_adjmats

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats"}
```

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                            |
| :-------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats/properties/id")                                 |
| [filename](#filename) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-filename-of-the-csv-file.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats/properties/filename")     |
| [source](#source)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-source-of-the-adjacency-matrix.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats/properties/source") |

### id




`id`

-   is required
-   Type: `string` ([ID](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats/properties/id")

#### id Type

`string` ([ID](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-id.md))

### filename




`filename`

-   is required
-   Type: `string` ([Filename of the csv file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-filename-of-the-csv-file.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-filename-of-the-csv-file.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats/properties/filename")

#### filename Type

`string` ([Filename of the csv file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-filename-of-the-csv-file.md))

### source




`source`

-   is required
-   Type: `string` ([Source of the adjacency matrix](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-source-of-the-adjacency-matrix.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-source-of-the-adjacency-matrix.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_adjmats/properties/source")

#### source Type

`string` ([Source of the adjacency matrix](config-definitions-fixed-adjacenty-matrix-of-a-graph-properties-source-of-the-adjacency-matrix.md))

## Definitions group notears_dag_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling"}
```

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                      |
| :---------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/id") |
| [num_nodes](#num_nodes) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")       |
| [num_edges](#num_edges) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")       |

### id




`id`

-   is required
-   Type: `string` ([ID](config-definitions-notears-dag-sampling-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/id")

#### id Type

`string` ([ID](config-definitions-notears-dag-sampling-properties-id.md))

### num_nodes

Non-negative integers, (0,1,2,...), or array of the same.


`num_nodes`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")

#### num_nodes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### num_edges

Non-negative integers, (0,1,2,...), or array of the same.


`num_edges`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")

#### num_edges Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## Definitions group roc_item

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item"}
```

| Property                                                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :------------------------------------------------------------ | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [structure_learning_algorithm](#structure_learning_algorithm) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-structure_learning_algorithm.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/structure_learning_algorithm") |
| [curve_variable](#curve_variable)                             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-curve-variable.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/curve_variable")                             |

### structure_learning_algorithm




`structure_learning_algorithm`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-structure_learning_algorithm.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/structure_learning_algorithm")

#### structure_learning_algorithm Type

`string`

### curve_variable

The varying parameter in the roc curve. This must be one of the parameters for the actual algorithm.


`curve_variable`

-   is optional
-   Type: merged type ([Curve variable](config-definitions-roc-item-properties-curve-variable.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-curve-variable.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/curve_variable")

#### curve_variable Type

merged type ([Curve variable](config-definitions-roc-item-properties-curve-variable.md))

any of

-   [Curve variable](config-definitions-roc-item-properties-curve-variable-anyof-curve-variable.md "check type definition")
-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-roc-item-properties-curve-variable-anyof-1.md "check type definition")

## Definitions group data_setup_dict

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict"}
```

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                       |
| :------------------------ | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [graph](#graph)           | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/graph")           |
| [parameters](#parameters) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/parameters") |
| [data](#data)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/data")             |
| [seed_range](#seed_range) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/seed_range") |

### graph

ID of the graph instantiation.


`graph`

-   is required
-   Type: `string` ([Graph](config-definitions-data-setup-properties-graph.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/graph")

#### graph Type

`string` ([Graph](config-definitions-data-setup-properties-graph.md))

### parameters

Parameters ID.


`parameters`

-   is required
-   Type: merged type ([Parameters](config-definitions-data-setup-properties-parameters.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/parameters")

#### parameters Type

merged type ([Parameters](config-definitions-data-setup-properties-parameters.md))

any of

-   [Untitled string in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters-anyof-0.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters-anyof-1.md "check type definition")

### data

Data sampling method ID.


`data`

-   is required
-   Type: `string` ([Data](config-definitions-data-setup-properties-data.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/data")

#### data Type

`string` ([Data](config-definitions-data-setup-properties-data.md))

### seed_range

This data setup will be simulated for this range of seeds. E.g. seed_range:[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.


`seed_range`

-   is required
-   Type: merged type ([Seed range](config-definitions-data-setup-properties-seed-range.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/seed_range")

#### seed_range Type

merged type ([Seed range](config-definitions-data-setup-properties-seed-range.md))

any of

-   [List of 2 integers \[a, b\], where a&lt;=b.](config-definitions-data-setup-properties-seed-range-anyof-list-of-2-integers-a-b-where-ab.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range-anyof-1.md "check type definition")

## Definitions group standard_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/standard_sampling"}
```

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                       |
| :---------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard-sampling-properties-unique-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/standard_sampling/properties/id") |
| [sample_sizes](#sample_sizes) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/standard_sampling/properties/sample_sizes")        |

### id




`id`

-   is required
-   Type: `string` ([Unique ID](config-definitions-standard-sampling-properties-unique-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-standard-sampling-properties-unique-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/standard_sampling/properties/id")

#### id Type

`string` ([Unique ID](config-definitions-standard-sampling-properties-unique-id.md))

### sample_sizes

Non-negative integers, (0,1,2,...), or array of the same.


`sample_sizes`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/standard_sampling/properties/sample_sizes")

#### sample_sizes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## Definitions group generateDAGMaxParents

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents"}
```

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :------------------------ | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents/properties/id") |
| [av_parents](#av_parents) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents/properties/av_parents")       |
| [dims](#dims)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents/properties/dims")             |

### id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents/properties/id")

#### id Type

`string`

### av_parents

Non-negative integers, (0,1,2,...), or array of the same.


`av_parents`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents/properties/av_parents")

#### av_parents Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### dims

Non-negative integers, (0,1,2,...), or array of the same.


`dims`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateDAGMaxParents/properties/dims")

#### dims Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## Definitions group generateBinaryBN

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN"}
```

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                              |
| :---------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/id") |
| [min](#min) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/min")       |
| [max](#max) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/max")       |

### id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/id")

#### id Type

`string`

### min




`min`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/min")

#### min Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### max




`max`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/max")

#### max Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## Definitions group prob

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/prob"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group natnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/natnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group nonnegint

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/nonnegint"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group nonnegnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/nonnegnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexnonnegnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegnumnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexnonnegnumnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegint

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexnonnegint"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnonnegintnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexnonnegintnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnatnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexnatnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexnatnumnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexnatnumnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexprob

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexprob"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group flexprobnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/flexprobnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | ---- | -------- | -------- | :--------- |

## Definitions group trilearn_loglin

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                       |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/alpha")               |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/beta")                |
| [pseudo_obs](#pseudo_obs)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/pseudo_obs")                    |
| [radii](#radii)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/radii")                 |
| [N](#N)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/N")                   |
| [M](#M)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/M")                   |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/burnin")                |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/threshold")           |

### id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### beta




`beta`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/beta")

#### beta Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### pseudo_obs

Non-negative number(s).


`pseudo_obs`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/pseudo_obs")

#### pseudo_obs Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### radii

Non-negative integers, (0,1,2,...), or array of the same.


`radii`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/radii")

#### radii Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### N




`N`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/N")

#### N Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

-   [Positive integer](config-definitions-non-negative-integers-1-anyof-positive-integer.md "check type definition")
-   [Positive integer list](config-definitions-non-negative-integers-1-anyof-positive-integer-list.md "check type definition")

### M




`M`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/M")

#### M Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

-   [Positive integer](config-definitions-non-negative-integers-1-anyof-positive-integer.md "check type definition")
-   [Positive integer list](config-definitions-non-negative-integers-1-anyof-positive-integer-list.md "check type definition")

### burnin

Non-negative integers, (0,1,2,...), or array of the same.


`burnin`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/burnin")

#### burnin Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### threshold




`threshold`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/threshold")

#### threshold Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## Definitions group blip

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip"}
```

| Property                        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                           |
| :------------------------------ | --------- | -------- | -------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-unique-idenfifier.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/id")         |
| [plot_legend](#plot_legend)     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/plot_legend")           |
| [scorer.method](#scorer.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorer.method")   |
| [solver.method](#solver.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/solver.method")   |
| [indeg](#indeg)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/indeg")                                |
| [time](#time)                   | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/time")                                         |
| [allocated](#allocated)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/allocated")                            |
| [scorefunction](#scorefunction) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorefunction")  |
| [alpha](#alpha)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/alpha")                              |
| [cores](#cores)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/cores")                                |
| [verbose](#verbose)             | `integer` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/verbose") |

### id

Unique idenfifier for that can be used as reference in the benchmark_setup.


`id`

-   is required
-   Type: `string` ([Unique idenfifier](config-definitions-blip-instantiation-properties-unique-idenfifier.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-unique-idenfifier.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/id")

#### id Type

`string` ([Unique idenfifier](config-definitions-blip-instantiation-properties-unique-idenfifier.md))

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string` ([Legend](config-definitions-blip-instantiation-properties-legend.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/plot_legend")

#### plot_legend Type

`string` ([Legend](config-definitions-blip-instantiation-properties-legend.md))

### scorer.method




`scorer.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorer.method")

#### scorer.method Type

`string`

### solver.method




`solver.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/solver.method")

#### solver.method Type

`string`

### indeg

Non-negative integers, (0,1,2,...), or array of the same.


`indeg`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/indeg")

#### indeg Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### time

Non-negative number(s).


`time`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/time")

#### time Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### allocated

Non-negative integers, (0,1,2,...), or array of the same.


`allocated`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/allocated")

#### allocated Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### scorefunction




`scorefunction`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorefunction")

#### scorefunction Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### cores

Non-negative integers, (0,1,2,...), or array of the same.


`cores`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/cores")

#### cores Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### verbose

Non-negative integer, 0,1,2,...


`verbose`

-   is required
-   Type: `integer` ([Non-negative integer](config-definitions-blip-instantiation-properties-non-negative-integer.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/verbose")

#### verbose Type

`integer` ([Non-negative integer](config-definitions-blip-instantiation-properties-non-negative-integer.md))

#### verbose Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## Definitions group notears

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears"}
```

| Property                                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                |
| :-------------------------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/id")                     |
| [plot_legend](#plot_legend)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/plot_legend")   |
| [min_rate_of_progress](#min_rate_of_progress) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/min_rate_of_progress") |
| [penalty_growth_rate](#penalty_growth_rate)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/penalty_growth_rate")            |
| [optimation_accuracy](#optimation_accuracy)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/optimation_accuracy")            |
| [loss](#loss)                                 | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss")                 |
| [loss_grad](#loss_grad)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss_grad")       |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/plot_legend")

#### plot_legend Type

`string`

### min_rate_of_progress




`min_rate_of_progress`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/min_rate_of_progress")

#### min_rate_of_progress Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### penalty_growth_rate

Non-negative number(s).


`penalty_growth_rate`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/penalty_growth_rate")

#### penalty_growth_rate Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### optimation_accuracy

Non-negative number(s).


`optimation_accuracy`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/optimation_accuracy")

#### optimation_accuracy Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### loss




`loss`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss")

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
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss_grad")

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
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp"}
```

| Property                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :-------------------------- | --------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/id")                   |
| [plot_legend](#plot_legend) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot_legend") |
| [plot](#plot)               | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot")               |
| [palim](#palim)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/palim")                          |
| [alpha](#alpha)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/alpha")                        |
| [prune](#prune)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/prune")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot_legend")

#### plot_legend Type

`string`

### plot




`plot`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot")

#### plot Type

`boolean`

### palim

Non-negative integers, (0,1,2,...), or array of the same.


`palim`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/palim")

#### palim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### prune




`prune`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/prune")

#### prune Type

`boolean`

## Definitions group greenthomas

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                     |
| :-------------------------- | -------- | -------- | -------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/plot_legend") |
| [n_samples](#n_samples)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/n_samples")                                                                               |
| [penalty](#penalty)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/penalty")                                                                                         |
| [randomits](#randomits)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/randomits")                                                                               |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/plot_legend")

#### plot_legend Type

`string`

### n_samples

Non-negative integers, (0,1,2,...), or array of the same.


`n_samples`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/n_samples")

#### n_samples Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### penalty

Non-negative number(s).


`penalty`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/penalty")

#### penalty Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### randomits

Non-negative integers, (0,1,2,...), or array of the same.


`randomits`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/greenthomas/properties/randomits")

#### randomits Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## Definitions group fges

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges"}
```

| Property                                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                      |
| :------------------------------------------ | --------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/id")                                   |
| [plot_legend](#plot_legend)                 | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/plot_legend")                 |
| [faithfulnessAssumed](#faithfulnessAssumed) | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-faithfulnessassumed.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/faithfulnessAssumed") |
| [score](#score)                             | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/score")                             |
| [data-type](#data-type)                     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/data-type")                     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/plot_legend")

#### plot_legend Type

`string`

### faithfulnessAssumed




`faithfulnessAssumed`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-faithfulnessassumed.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/faithfulnessAssumed")

#### faithfulnessAssumed Type

`boolean`

### score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/score")

#### score Type

`string`

### data-type




`data-type`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fges/properties/data-type")

#### data-type Type

`string`

## Definitions group fci

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                      |
| :-------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/alpha")          |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/test")               |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/data-type")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/test")

#### test Type

`string`

### data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-fci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fci/properties/data-type")

#### data-type Type

`string`

## Definitions group gfci

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/alpha")                             |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/test")               |
| [score](#score)             | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/score")             |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/data-type")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/test")

#### test Type

`string`

### score




`score`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/score")

#### score Type

`string`

### data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-parameter-setting-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gfci/properties/data-type")

#### data-type Type

`string`

## Definitions group rfci

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/alpha")           |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/test")               |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/data-type")     |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/test")

#### test Type

`string`

### data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/data-type")

#### data-type Type

`string`

## Definitions group pcalg

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                 |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg/properties/alpha")                   |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## Definitions group mmhc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc"}
```

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :------------------------------ | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/id")                             |
| [plot_legend](#plot_legend)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/plot_legend")           |
| [restrict.args](#restrict.args) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/restrict.args") |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/plot_legend")

#### plot_legend Type

`string`

### restrict.args




`restrict.args`

-   is required
-   Type: `object` ([Parameters for mmhc](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/restrict.args")

#### restrict.args Type

`object` ([Parameters for mmhc](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md))

## Definitions group h2pc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc"}
```

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                           |
| :------------------------------ | -------- | -------- | -------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/id")                            |
| [plot_legend](#plot_legend)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/plot_legend")          |
| [restrict.args](#restrict.args) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args") |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/plot_legend")

#### plot_legend Type

`string`

### restrict.args




`restrict.args`

-   is required
-   Type: `object` ([Paramters for h2pc](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args")

#### restrict.args Type

`object` ([Paramters for h2pc](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md))

## Definitions group interiamb

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                             |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-inter-iamb-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-inter-iamb-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb/properties/alpha")                           |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-inter-iamb-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-inter-iamb-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/interiamb/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## Definitions group gs

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                           |
| :-------------------------- | -------- | -------- | -------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs/properties/alpha")                                                |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs/properties/plot_legend")

#### plot_legend Type

`string`

### alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gs/properties/alpha")

#### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## Definitions group tabu

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                 |
| :-------------------------- | -------- | -------- | -------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/plot_legend") |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/beta")                                               |
| [score](#score)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/score")             |
| [iss](#iss)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/iss")                                        |
| [iss.mu](#iss.mu)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/iss.mu")                                     |
| [l](#l)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/l")                                          |
| [k](#k)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/k")                                          |
| [prior](#prior)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/prior")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/plot_legend")

#### plot_legend Type

`string`

### beta

Non-negative number(s).


`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/beta")

#### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/score")

#### score Type

`string`

### iss

Non-negative integers, (0,1,2,...), or array of the same.


`iss`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/iss")

#### iss Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### iss.mu

Non-negative integers, (0,1,2,...), or array of the same.


`iss.mu`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/iss.mu")

#### iss.mu Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### l

Non-negative integers, (0,1,2,...), or array of the same.


`l`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/l")

#### l Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### k

Non-negative integers, (0,1,2,...), or array of the same.


`k`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/k")

#### k Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### prior




`prior`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tabu/properties/prior")

#### prior Type

`string`

## Definitions group hc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/plot_legend") |
| [perturb](#perturb)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/perturb")                                     |
| [restart](#restart)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/restart")                                     |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/beta")                                                |
| [score](#score)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/score")             |
| [iss](#iss)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss")                                         |
| [iss.mu](#iss.mu)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss.mu")                                      |
| [l](#l)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/l")                                           |
| [k](#k)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/k")                                           |
| [prior](#prior)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/prior")             |

### id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/plot_legend")

#### plot_legend Type

`string`

### perturb

Non-negative integers, (0,1,2,...), or array of the same.


`perturb`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/perturb")

#### perturb Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### restart

Non-negative integers, (0,1,2,...), or array of the same.


`restart`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/restart")

#### restart Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### beta

Non-negative number(s).


`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/beta")

#### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

### score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/score")

#### score Type

`string`

### iss

Non-negative integers, (0,1,2,...), or array of the same.


`iss`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss")

#### iss Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### iss.mu

Non-negative integers, (0,1,2,...), or array of the same.


`iss.mu`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss.mu")

#### iss.mu Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### l

Non-negative integers, (0,1,2,...), or array of the same.


`l`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/l")

#### l Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### k

Non-negative integers, (0,1,2,...), or array of the same.


`k`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/k")

#### k Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

### prior




`prior`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/prior")

#### prior Type

`string`

## Definitions group itsearch

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/id")                            |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/plot_legend")          |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional") |

### id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/plot_legend")

#### plot_legend Type

`string`

### optional

Algorithm parameters to show in plotting


`optional`

-   is optional
-   Type: `object` ([Parameters for itsearch](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional")

#### optional Type

`object` ([Parameters for itsearch](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md))

## Definitions group order_mcmc

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc"}
```

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                     |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/id")                                 |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/plot_legend")               |
| [startspace](#startspace)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/startspace")                 |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/optional")    |
| [scoretype](#scoretype)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/scoretype")                   |
| [chi](#chi)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/chi")      |
| [edgepf](#edgepf)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/edgepf") |
| [am](#am)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-2.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/am")     |
| [aw](#aw)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-3.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/aw")     |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/threshold")                                              |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/burnin")                                                   |

### id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/id")

#### id Type

`string`

### plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/plot_legend")

#### plot_legend Type

`string`

### startspace




`startspace`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/startspace")

#### startspace Type

`string`

### optional




`optional`

-   is optional
-   Type: `object` ([Parameters for order_mcmc](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/optional")

#### optional Type

`object` ([Parameters for order_mcmc](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md))

### scoretype




`scoretype`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/scoretype")

#### scoretype Type

`string`

### chi

E.g. 1.5 or [1.6, 3.8] or null.


`chi`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/chi")

#### chi Type

merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

### edgepf

E.g. 1.5 or [1.6, 3.8] or null.


`edgepf`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/edgepf")

#### edgepf Type

merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-1.md))

any of

-   any of

    -   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

### am

E.g. 1.5 or [1.6, 3.8] or null.


`am`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-2.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-2.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/am")

#### am Type

merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-2.md))

any of

-   any of

    -   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

### aw

E.g. 1.5 or [1.6, 3.8] or null.


`aw`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-3.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-3.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/aw")

#### aw Type

merged type ([Non-negative number(s) or null](config-definitions-order-mcmc-paramter-setting---properties-non-negative-numbers-or-null-3.md))

any of

-   any of

    -   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

### threshold




`threshold`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/threshold")

#### threshold Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

### burnin

Non-negative integers, (0,1,2,...), or array of the same.


`burnin`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/burnin")

#### burnin Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
