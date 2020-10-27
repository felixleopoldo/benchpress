# Data file Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data
```

Data file in csv format separated by empy space ' '. The firs row must have the variable names. For categorical data, the second row shold contain the possible values for the specific variable.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## fixed_data Type

unknown ([Data file](config-definitions-data-file.md))

# Data file Properties

| Property              | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :-------------------- | ------------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)             | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/id")                        |
| [filename](#filename) | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-filename.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/filename")       |
| [graph](#graph)       | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-underlying-graph-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/graph")    |
| [source](#source)     | `string`      | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-source.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/source")           |
| [datatype](#datatype) | Not specified | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/datatype")           |
| [samples](#samples)   | `integer`     | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-file-properties-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/samples") |

## id




`id`

-   is optional
-   Type: `string` ([ID](config-definitions-data-file-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/id")

### id Type

`string` ([ID](config-definitions-data-file-properties-id.md))

## filename




`filename`

-   is optional
-   Type: `string` ([Data filename](config-definitions-data-file-properties-data-filename.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-filename.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/filename")

### filename Type

`string` ([Data filename](config-definitions-data-file-properties-data-filename.md))

## graph




`graph`

-   is optional
-   Type: `string` ([Underlying graph id](config-definitions-data-file-properties-underlying-graph-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-underlying-graph-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/graph")

### graph Type

`string` ([Underlying graph id](config-definitions-data-file-properties-underlying-graph-id.md))

## source




`source`

-   is optional
-   Type: `string` ([Data source](config-definitions-data-file-properties-data-source.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-source.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/source")

### source Type

`string` ([Data source](config-definitions-data-file-properties-data-source.md))

## datatype




`datatype`

-   is optional
-   Type: unknown ([Data type](config-definitions-data-file-properties-data-type.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/datatype")

### datatype Type

unknown ([Data type](config-definitions-data-file-properties-data-type.md))

### datatype Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value           | Explanation |
| :-------------- | ----------- |
| `"continuous"`  |             |
| `"binary"`      |             |
| `"categorical"` |             |

## samples

Non-negative integer, 0,1,2,...


`samples`

-   is optional
-   Type: `integer` ([Non-negative integer](config-definitions-data-file-properties-non-negative-integer.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-file-properties-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/fixed_data/properties/samples")

### samples Type

`integer` ([Non-negative integer](config-definitions-data-file-properties-non-negative-integer.md))

### samples Constraints

**minimum**: the value of this number must greater than or equal to: `0`
