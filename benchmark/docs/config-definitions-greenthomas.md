# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas
```

Green & Thomas instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## greenthomas Type

`object` ([Details](config-definitions-greenthomas.md))

# undefined Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                          |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/plot_legend") |
| [n_samples](#n_samples)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/n_samples")                        |
| [penalty](#penalty)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/penalty")                          |
| [randomits](#randomits)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/randomits")                        |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-greenthomas-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/plot_legend")

### plot_legend Type

`string`

## n_samples




`n_samples`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/n_samples")

### n_samples Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## penalty




`penalty`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/penalty")

### penalty Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

## randomits




`randomits`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/greenthomas/properties/randomits")

### randomits Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")
