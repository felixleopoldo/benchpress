# Order MCMC (paramter setting  ) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc
```

Order MCMC algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## order_mcmc Type

`object` ([Order MCMC (paramter setting  )](config-definitions-order-mcmc-paramter-setting--.md))

# Order MCMC (paramter setting  ) Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/id")                              |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/plot_legend")            |
| [startspace](#startspace)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/startspace")              |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/optional") |
| [scoretype](#scoretype)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/scoretype")                |
| [chi](#chi)                 | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/chi")                                            |
| [edgepf](#edgepf)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/edgepf")                                         |
| [am](#am)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/am")                                             |
| [aw](#aw)                   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/aw")                                             |
| [threshold](#threshold)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/threshold")                                           |
| [burnin](#burnin)           | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/burnin")                                                |

## id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/plot_legend")

### plot_legend Type

`string`

## startspace




`startspace`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-startspace.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/startspace")

### startspace Type

`string`

## optional




`optional`

-   is optional
-   Type: `object` ([Parameters for order_mcmc](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/optional")

### optional Type

`object` ([Parameters for order_mcmc](config-definitions-order-mcmc-paramter-setting---properties-parameters-for-order_mcmc.md))

## scoretype




`scoretype`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-order-mcmc-paramter-setting---properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/scoretype")

### scoretype Type

`string`

## chi

E.g. 1.5 or [1.6, 3.8] or null.


`chi`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/chi")

### chi Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## edgepf

E.g. 1.5 or [1.6, 3.8] or null.


`edgepf`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/edgepf")

### edgepf Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## am

E.g. 1.5 or [1.6, 3.8] or null.


`am`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/am")

### am Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## aw

E.g. 1.5 or [1.6, 3.8] or null.


`aw`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/aw")

### aw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## threshold




`threshold`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/threshold")

### threshold Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## burnin

Non-negative integers, (0,1,2,...), or array of the same.


`burnin`

-   is required
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/order_mcmc/properties/burnin")

### burnin Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
