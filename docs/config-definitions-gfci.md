# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci
```

GFCI instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## gfci Type

`object` ([Details](config-definitions-gfci.md))

# undefined Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                            |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/alpha")                          |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/test")               |
| [score](#score)             | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/score")             |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/data-type")     |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/plot_legend")

### plot_legend Type

`string`

## alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/test")

### test Type

`string`

## score




`score`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/score")

### score Type

`string`

## data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gfci/properties/data-type")

### data-type Type

`string`
