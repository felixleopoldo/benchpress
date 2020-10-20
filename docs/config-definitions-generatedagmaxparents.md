# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents
```

An instance of generateDAGMaxParents


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## generateDAGMaxParents Type

`object` ([Details](config-definitions-generatedagmaxparents.md))

# undefined Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :---------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)               | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/id")               |
| [av_parent](#av_parent) | `array`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-av_parent.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/av_parent") |
| [dims](#dims)           | `array`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-dims.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/dims")           |

## id




`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/id")

### id Type

`string`

## av_parent

Maximum average number of parents


`av_parent`

-   is optional
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-av_parent.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/av_parent")

### av_parent Type

`integer[]`

## dims

Dimensions of the DAGs, a list of list of dimensions, matching the sample_sizes in the data setup.


`dims`

-   is required
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatedagmaxparents-properties-dims.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateDAGMaxParents/properties/dims")

### dims Type

`integer[]`
