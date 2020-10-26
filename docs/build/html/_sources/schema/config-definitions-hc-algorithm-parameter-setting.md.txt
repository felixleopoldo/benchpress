# HC algorithm (parameter setting) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc
```

HC algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## hc Type

`object` ([HC algorithm (parameter setting)](config-definitions-hc-algorithm-parameter-setting.md))

# HC algorithm (parameter setting) Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/plot_legend") |
| [perturb](#perturb)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/perturb")                                     |
| [restart](#restart)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/restart")                                     |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/beta")                                                |
| [score](#score)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/score")             |
| [iss](#iss)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss")                                         |
| [iss.mu](#iss.mu)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss.mu")                                      |
| [l](#l)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/l")                                           |
| [k](#k)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/k")                                           |
| [prior](#prior)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/prior")             |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/plot_legend")

### plot_legend Type

`string`

## perturb

Non-negative integers, (0,1,2,...), or array of the same.


`perturb`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/perturb")

### perturb Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## restart

Non-negative integers, (0,1,2,...), or array of the same.


`restart`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/restart")

### restart Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## beta

Non-negative number(s).


`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/beta")

### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
-   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/score")

### score Type

`string`

## iss

Non-negative integers, (0,1,2,...), or array of the same.


`iss`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss")

### iss Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## iss.mu

Non-negative integers, (0,1,2,...), or array of the same.


`iss.mu`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/iss.mu")

### iss.mu Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## l

Non-negative integers, (0,1,2,...), or array of the same.


`l`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/l")

### l Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## k

Non-negative integers, (0,1,2,...), or array of the same.


`k`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/k")

### k Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## prior




`prior`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-algorithm-parameter-setting-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/hc/properties/prior")

### prior Type

`string`
