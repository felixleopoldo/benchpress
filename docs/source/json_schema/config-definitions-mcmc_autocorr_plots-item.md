# mcmc_autocorr_plots item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item
```

Plots the auto correlation for a given functional in a MCMC trajectory.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## mcmc_autocorr_plots_item Type

unknown ([mcmc_autocorr_plots item](config-definitions-mcmc_autocorr_plots-item.md))

## mcmc_autocorr_plots_item Examples

```json
{
  "id": "omcmc_itsample-bge",
  "burn_in": 0,
  "thinning": 1,
  "lags": 50,
  "functional": [
    "score",
    "size"
  ],
  "active": true
}
```

# mcmc_autocorr_plots item Properties

| Property                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                     |
| :------------------------ | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/id")                   |
| [burn_in](#burn_in)       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/burn_in")                             |
| [thinning](#thinning)     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/thinning")                      |
| [active](#active)         | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/active")           |
| [lags](#lags)             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/lags")                          |
| [functional](#functional) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-stringorlist.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/functional") |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/id")

### id Type

`string`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/burn_in")

### burn_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## thinning



`thinning`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/thinning")

### thinning Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## active



`active`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/active")

### active Type

`boolean`

## lags



`lags`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/lags")

### lags Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## functional



`functional`

*   is required

*   Type: merged type ([stringorlist](config-definitions-mcmc_autocorr_plots-item-properties-stringorlist.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-stringorlist.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_autocorr_plots_item/properties/functional")

### functional Type

merged type ([stringorlist](config-definitions-mcmc_autocorr_plots-item-properties-stringorlist.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-stringorlist-anyof-0.md "check type definition")

*   [Untitled array in JSON schema for Benchpress config file.](config-definitions-mcmc_autocorr_plots-item-properties-stringorlist-anyof-1.md "check type definition")
