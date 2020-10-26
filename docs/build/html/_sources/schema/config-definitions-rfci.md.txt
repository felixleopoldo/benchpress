# RFCI Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci
```

RFCI instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## rfci Type

`object` ([RFCI](config-definitions-rfci.md))

# RFCI Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/alpha")           |
| [test](#test)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/test")               |
| [data-type](#data-type)     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/data-type")     |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/plot_legend")

### plot_legend Type

`string`

## alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## test




`test`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/test")

### test Type

`string`

## data-type




`data-type`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-data-type.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rfci/properties/data-type")

### data-type Type

`string`
