# Benchmark setup Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup
```

Description of the benchmarking setup.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## benchmark_setup Type

`object` ([Benchmark setup](config-properties-benchmark-setup.md))

# benchmark_setup Properties

| Property                  | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                             |
| :------------------------ | :------------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [data](#data)             | `array`       | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-data-setup.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/data")               |
| [evaluation](#evaluation) | Not specified | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation") |

## data

A list of data setup instantiations.

`data`

*   is required

*   Type: `object[]` ([Data setup](config-definitions-data-setup.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-data-setup.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/data")

### data Type

`object[]` ([Data setup](config-definitions-data-setup.md))

### data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## evaluation



`evaluation`

*   is required

*   Type: unknown ([Evaluation methods](config-properties-benchmark-setup-properties-evaluation-methods.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation")

### evaluation Type

unknown ([Evaluation methods](config-properties-benchmark-setup-properties-evaluation-methods.md))
