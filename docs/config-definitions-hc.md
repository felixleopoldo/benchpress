# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/hc
```

HC algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## hc Type

`object` ([Details](config-definitions-hc.md))

# undefined Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/plot_legend") |
| [perturb](#perturb)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/perturb")                 |
| [restart](#restart)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/restart")                 |
| [beta](#beta)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/beta")                    |
| [score](#score)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/score")             |
| [iss](#iss)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss")                     |
| [iss.mu](#iss.mu)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss.mu")                  |
| [l](#l)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/l")                       |
| [k](#k)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/k")                       |
| [prior](#prior)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-hc-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/prior")             |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/plot_legend")

### plot_legend Type

`string`

## perturb




`perturb`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/perturb")

### perturb Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## restart




`restart`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/restart")

### restart Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## beta




`beta`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/beta")

### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

## score




`score`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-score.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/score")

### score Type

`string`

## iss




`iss`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss")

### iss Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## iss.mu




`iss.mu`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/iss.mu")

### iss.mu Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## l




`l`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/l")

### l Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## k




`k`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/k")

### k Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")

## prior




`prior`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-hc-properties-prior.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/hc/properties/prior")

### prior Type

`string`
