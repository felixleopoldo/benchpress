# Trilearn Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin
```

Parameter setting for trilearn with log-linear decomposable model.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## trilearn_loglin Type

`object` ([Trilearn](config-definitions-trilearn.md))

# Trilearn Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                       |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/plot_legend") |
| [alpha](#alpha)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/alpha")               |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/beta")                |
| [pseudo_obs](#pseudo_obs)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/pseudo_obs")                    |
| [radii](#radii)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/radii")                 |
| [N](#N)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/N")                   |
| [M](#M)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/M")                   |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/burnin")                |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/threshold")           |

## id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-trilearn-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/plot_legend")

### plot_legend Type

`string`

## alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## beta




`beta`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/beta")

### beta Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## pseudo_obs

Non-negative number(s).


`pseudo_obs`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/pseudo_obs")

### pseudo_obs Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## radii

Non-negative integers, (0,1,2,...), or array of the same.


`radii`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/radii")

### radii Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## N




`N`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/N")

### N Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

-   [Positive integer](config-definitions-positive-integer.md "check type definition")
-   [Positive integer list](config-definitions-non-negative-integers-1-anyof-positive-integer-list.md "check type definition")

## M




`M`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-1.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/M")

### M Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

-   [Positive integer](config-definitions-positive-integer.md "check type definition")
-   [Positive integer list](config-definitions-non-negative-integers-1-anyof-positive-integer-list.md "check type definition")

## burnin

Non-negative integers, (0,1,2,...), or array of the same.


`burnin`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/burnin")

### burnin Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## threshold




`threshold`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_loglin/properties/threshold")

### threshold Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")
