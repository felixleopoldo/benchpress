# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup
```

Description of the benchmarking setup.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## benchmark_setup Type

`object` ([Details](config-properties-benchmark_setup.md))

# undefined Properties

| Property                                                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                    |
| :-------------------------------------------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [structure_learning_algorithms](#structure_learning_algorithms) | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-structure_learning_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/structure_learning_algorithms") |
| [models](#models)                                               | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-models.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/models")                                               |
| [fixed_data](#fixed_data)                                       | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-fixed_data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/fixed_data")                                       |
| [data_sampling_algorithms](#data_sampling_algorithms)           | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-data_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/data_sampling_algorithms")           |
| [seed_range](#seed_range)                                       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-seed_range.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/seed_range")                                       |

## structure_learning_algorithms




`structure_learning_algorithms`

-   is optional
-   Type: `array`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-structure_learning_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/structure_learning_algorithms")

### structure_learning_algorithms Type

`array`

### structure_learning_algorithms Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## models




`models`

-   is optional
-   Type: `object[]` ([Details](config-definitions-sampled_model_dict.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-models.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/models")

### models Type

`object[]` ([Details](config-definitions-sampled_model_dict.md))

## fixed_data




`fixed_data`

-   is optional
-   Type: `object[]` ([Details](config-definitions-fixed_data_dict.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-fixed_data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/fixed_data")

### fixed_data Type

`object[]` ([Details](config-definitions-fixed_data_dict.md))

### fixed_data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## data_sampling_algorithms




`data_sampling_algorithms`

-   is optional
-   Type: `array`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-data_sampling_algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/data_sampling_algorithms")

### data_sampling_algorithms Type

`array`

## seed_range

Interval of seeds to simulate from.


`seed_range`

-   is optional
-   Type: `object` ([Details](config-properties-benchmark_setup-properties-seed_range.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark_setup-properties-seed_range.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/benchmark_setup/properties/seed_range")

### seed_range Type

`object` ([Details](config-properties-benchmark_setup-properties-seed_range.md))
