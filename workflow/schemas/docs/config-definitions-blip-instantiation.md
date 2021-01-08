# Blip instantiation Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip
```

Blip instantiation


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## blip Type

`object` ([Blip instantiation](config-definitions-blip-instantiation.md))

# Blip instantiation Properties

| Property                        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :------------------------------ | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-unique-idenfifier.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/id")        |
| [plot_legend](#plot_legend)     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/plot_legend")          |
| [scorer.method](#scorer.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorer.method")  |
| [solver.method](#solver.method) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/solver.method")  |
| [indeg](#indeg)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/indeg")                               |
| [time](#time)                   | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/time")                                        |
| [allocated](#allocated)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/allocated")                           |
| [scorefunction](#scorefunction) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorefunction") |
| [alpha](#alpha)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/alpha")                             |
| [cores](#cores)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/cores")                               |
| [verbose](#verbose)             | `integer` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/verbose")                              |

## id

Unique idenfifier for that can be used as reference in the benchmark_setup.


`id`

-   is required
-   Type: `string` ([Unique idenfifier](config-definitions-blip-instantiation-properties-unique-idenfifier.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-unique-idenfifier.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/id")

### id Type

`string` ([Unique idenfifier](config-definitions-blip-instantiation-properties-unique-idenfifier.md))

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string` ([Legend](config-definitions-blip-instantiation-properties-legend.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/plot_legend")

### plot_legend Type

`string` ([Legend](config-definitions-blip-instantiation-properties-legend.md))

## scorer.method




`scorer.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorer.method")

### scorer.method Type

`string`

## solver.method




`solver.method`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-solvermethod.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/solver.method")

### solver.method Type

`string`

## indeg

Non-negative integers, (0,1,2,...), or array of the same.


`indeg`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/indeg")

### indeg Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## time

Non-negative number(s).


`time`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/time")

### time Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## allocated

Non-negative integers, (0,1,2,...), or array of the same.


`allocated`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/allocated")

### allocated Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## scorefunction




`scorefunction`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-blip-instantiation-properties-scorefunction.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/scorefunction")

### scorefunction Type

`string`

## alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## cores

Non-negative integers, (0,1,2,...), or array of the same.


`cores`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/cores")

### cores Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## verbose

Non-negative integer, 0,1,2,...


`verbose`

-   is required
-   Type: `integer` ([Non-negative integer](config-definitions-non-negative-integer.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integer.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/blip/properties/verbose")

### verbose Type

`integer` ([Non-negative integer](config-definitions-non-negative-integer.md))

### verbose Constraints

**minimum**: the value of this number must greater than or equal to: `0`
