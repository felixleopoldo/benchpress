# Benchmark setup Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup
```

Description of the benchmarking setup.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## benchmark_setup Type

`object` ([Benchmark setup](config-properties-benchmark-setup.md))

# Benchmark setup Properties

| Property                                                        | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                |
| :-------------------------------------------------------------- | ------------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [structure_learning_algorithms](#structure_learning_algorithms) | `array`       | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-structure-learning-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/structure_learning_algorithms") |
| [data](#data)                                                   | `array`       | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-data-setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/data")                                             |
| [evaluation](#evaluation)                                       | Not specified | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation")                               |

## structure_learning_algorithms

A list of id's for structure learning algorithm instantiations.


`structure_learning_algorithms`

-   is required
-   Type: `array` ([Structure learning algorithms](config-properties-benchmark-setup-properties-structure-learning-algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-structure-learning-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/structure_learning_algorithms")

### structure_learning_algorithms Type

`array` ([Structure learning algorithms](config-properties-benchmark-setup-properties-structure-learning-algorithms.md))

### structure_learning_algorithms Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## data

A list of data setup instantiations.


`data`

-   is required
-   Type: `object[]` ([Data setup](config-definitions-data-setup.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-data-setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/data")

### data Type

`object[]` ([Data setup](config-definitions-data-setup.md))

### data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## evaluation




`evaluation`

-   is required
-   Type: unknown ([Evaluation methods](config-properties-benchmark-setup-properties-evaluation-methods.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation")

### evaluation Type

unknown ([Evaluation methods](config-properties-benchmark-setup-properties-evaluation-methods.md))
