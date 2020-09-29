# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp
```

Gobnilp instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## gobnilp Type

`object` ([Details](config-definitions-gobnilp.md))

# undefined Properties

| Property                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                  |
| :-------------------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/id")                   |
| [plot_legend](#plot_legend) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot_legend") |
| [plot](#plot)               | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot")               |
| [palim](#palim)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/palim")                        |
| [alpha](#alpha)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/alpha")                             |
| [prune](#prune)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/prune")             |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot_legend")

### plot_legend Type

`string`

## plot




`plot`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/plot")

### plot Type

`boolean`

## palim




`palim`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/palim")

### palim Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## prune




`prune`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/gobnilp/properties/prune")

### prune Type

`boolean`
