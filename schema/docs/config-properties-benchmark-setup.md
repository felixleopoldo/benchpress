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

| Property                        | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                                                |
| :------------------------------ | ------------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [output_dir](#output_dir)       | `string`      | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-output-directory.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/output_dir")                 |
| [algorithm_ids](#algorithm_ids) | `array`       | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-structure-learning-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/algorithm_ids") |
| [data](#data)                   | `array`       | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-data-setup.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/data")                             |
| [evaluation](#evaluation)       | Not specified | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation")               |

## output_dir

Directory for the generated files.


`output_dir`

-   is required
-   Type: `string` ([Output directory](config-properties-benchmark-setup-properties-output-directory.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-output-directory.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/output_dir")

### output_dir Type

`string` ([Output directory](config-properties-benchmark-setup-properties-output-directory.md))

### output_dir Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value     | Explanation |
| :-------- | ----------- |
| `"files"` |             |

## algorithm_ids

A list of id's for structure learning algorithm instantiations.


`algorithm_ids`

-   is required
-   Type: `array` ([Structure learning algorithms](config-properties-benchmark-setup-properties-structure-learning-algorithms.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-structure-learning-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/algorithm_ids")

### algorithm_ids Type

`array` ([Structure learning algorithms](config-properties-benchmark-setup-properties-structure-learning-algorithms.md))

### algorithm_ids Constraints

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
