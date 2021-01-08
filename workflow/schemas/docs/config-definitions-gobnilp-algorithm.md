# Gobnilp algorithm Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp
```

Gobnilp instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## gobnilp Type

`object` ([Gobnilp algorithm](config-definitions-gobnilp-algorithm.md))

# Gobnilp algorithm Properties

| Property                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :-------------------------- | --------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/id")                   |
| [plot_legend](#plot_legend) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot_legend") |
| [plot](#plot)               | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot")               |
| [palim](#palim)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/palim")                          |
| [alpha](#alpha)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/alpha")                        |
| [prune](#prune)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/prune")             |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot_legend")

### plot_legend Type

`string`

## plot




`plot`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-plot.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/plot")

### plot Type

`boolean`

## palim

Non-negative integers, (0,1,2,...), or array of the same.


`palim`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/palim")

### palim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## prune




`prune`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-gobnilp-algorithm-properties-prune.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gobnilp/properties/prune")

### prune Type

`boolean`
