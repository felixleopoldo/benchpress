# Untitled undefined type in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## items Type

unknown

# items Properties

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                           |
| :------------------------ | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots-items-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/id")                 |
| [burn_in](#burn_in)       | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/burn_in")                              |
| [thinning](#thinning)     | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/thinning")                     |
| [lags](#lags)             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/lags")                         |
| [functional](#functional) | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots-items-properties-functional.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/functional") |

## id



`id`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots-items-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/id")

### id Type

`string`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is optional

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/burn_in")

### burn_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## thinning



`thinning`

*   is optional

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/thinning")

### thinning Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## lags



`lags`

*   is optional

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/lags")

### lags Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## functional



`functional`

*   is optional

*   Type: merged type ([Details](config-definitions-mcmc_autocorr_plots-items-properties-functional.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots-items-properties-functional.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_autocorr_plots/items/properties/functional")

### functional Type

merged type ([Details](config-definitions-mcmc_autocorr_plots-items-properties-functional.md))

any of

*   [Untitled string in JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots-items-properties-functional-anyof-0.md "check type definition")

*   [Untitled array in JSON schema for BenchPress config file.](config-definitions-mcmc_autocorr_plots-items-properties-functional-anyof-1.md "check type definition")
