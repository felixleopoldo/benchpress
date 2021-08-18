# benchmark_setup Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup
```

Description of the benchmarking setup.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## benchmark_setup Type

`object` ([benchmark_setup](config-properties-benchmark_setup.md))

# benchmark_setup Properties

| Property                  | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                               |
| :------------------------ | :------------ | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [data](#data)             | `array`       | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-data.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/data")             |
| [evaluation](#evaluation) | Not specified | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation") |

## data

The data setup for the study.

`data`

*   is required

*   Type: `object[]` ([data item](config-definitions-data-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-data.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/data")

### data Type

`object[]` ([data item](config-definitions-data-item.md))

### data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## evaluation



`evaluation`

*   is required

*   Type: unknown ([evaluation](config-properties-benchmark_setup-properties-evaluation.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation")

### evaluation Type

unknown ([evaluation](config-properties-benchmark_setup-properties-evaluation.md))
