# benchmark\_setup Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup
```

Defines the actual benchmarking setup, where the resources are references by their corresponding id.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## benchmark\_setup Type

`object` ([benchmark\_setup](config-properties-benchmark_setup.md))

# benchmark\_setup Properties

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

### data Examples

```json
[
  {
    "graph_id": "avneigs4_p20",
    "parameters_id": "SEM",
    "data_id": "standardized",
    "seed_range": [
      1,
      3
    ]
  }
]
```

## evaluation

This section contains the available evaluation methods.

`evaluation`

*   is required

*   Type: unknown ([evaluation](config-properties-benchmark_setup-properties-evaluation.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-benchmark_setup-properties-evaluation.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation")

### evaluation Type

unknown ([evaluation](config-properties-benchmark_setup-properties-evaluation.md))
