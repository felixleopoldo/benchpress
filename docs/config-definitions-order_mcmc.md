# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc
```

Order algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## order_mcmc Type

`object` ([Details](config-definitions-order_mcmc.md))

# undefined Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                        |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/id")                   |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/plot_legend") |
| [startspace](#startspace)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/startspace")   |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-optional.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/optional")       |
| [scoretype](#scoretype)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/scoretype")     |
| [chi](#chi)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/chi")                         |
| [edgepf](#edgepf)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/edgepf")                      |
| [am](#am)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/am")                          |
| [aw](#aw)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/aw")                          |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/threshold")                            |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/burnin")                          |

## id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/plot_legend")

### plot_legend Type

`string`

## startspace




`startspace`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/startspace")

### startspace Type

`string`

## optional




`optional`

-   is optional
-   Type: `object` ([Details](config-definitions-order_mcmc-properties-optional.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-optional.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/optional")

### optional Type

`object` ([Details](config-definitions-order_mcmc-properties-optional.md))

## scoretype




`scoretype`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order_mcmc-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/scoretype")

### scoretype Type

`string`

## chi




`chi`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/chi")

### chi Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## edgepf




`edgepf`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/edgepf")

### edgepf Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## am




`am`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/am")

### am Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## aw




`aw`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/aw")

### aw Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## threshold




`threshold`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/threshold")

### threshold Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## burnin




`burnin`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegint.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegint.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/order_mcmc/properties/burnin")

### burnin Type

merged type ([Details](config-definitions-flexnonnegint.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegint-anyof-1.md "check type definition")
