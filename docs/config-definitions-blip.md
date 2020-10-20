# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/blip
```

Blip instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## blip Type

`object` ([Details](config-definitions-blip.md))

# undefined Properties

| Property                        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                |
| :------------------------------ | --------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/id")                       |
| [plot_legend](#plot_legend)     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/plot_legend")     |
| [scorer.method](#scorer.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorer.method")  |
| [solver.method](#solver.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/solver.method")  |
| [indeg](#indeg)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/indeg")                         |
| [time](#time)                   | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/time")                          |
| [allocated](#allocated)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/allocated")                     |
| [scorefunction](#scorefunction) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorefunction") |
| [alpha](#alpha)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/alpha")                              |
| [cores](#cores)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/cores")                         |
| [verbose](#verbose)             | `integer` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-nonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/verbose")                           |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/plot_legend")

### plot_legend Type

`string`

## scorer.method




`scorer.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorer.method")

### scorer.method Type

`string`

## solver.method




`solver.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/solver.method")

### solver.method Type

`string`

## indeg




`indeg`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/indeg")

### indeg Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## time




`time`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/time")

### time Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

## allocated




`allocated`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/allocated")

### allocated Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## scorefunction




`scorefunction`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/scorefunction")

### scorefunction Type

`string`

## alpha




`alpha`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## cores




`cores`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/cores")

### cores Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## verbose

Non-negative integers, (0,1,2,...)


`verbose`

-   is required
-   Type: `integer`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-nonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/blip/properties/verbose")

### verbose Type

`integer`

### verbose Constraints

**minimum**: the value of this number must greater than or equal to: `0`
