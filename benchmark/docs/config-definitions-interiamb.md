# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb
```

Inter-IAMB algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## interiamb Type

`object` ([Details](config-definitions-interiamb.md))

# undefined Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                      |
| :-------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/alpha")                               |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-interiamb-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/plot_legend")

### plot_legend Type

`string`

## alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/interiamb/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")
