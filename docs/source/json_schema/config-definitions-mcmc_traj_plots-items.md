# Untitled undefined type in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## items Type

unknown

# undefined Properties

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                   |
| :------------------------ | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots-items-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/id")                 |
| [burn_in](#burn_in)       | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/burn_in")                          |
| [thinning](#thinning)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/thinning")                 |
| [functional](#functional) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots-items-properties-functional.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/functional") |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots-items-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/id")

### id Type

`string`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/burn_in")

### burn_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## thinning



`thinning`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/thinning")

### thinning Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## functional



`functional`

*   is required

*   Type: merged type ([Details](config-definitions-mcmc_traj_plots-items-properties-functional.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots-items-properties-functional.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_traj_plots/items/properties/functional")

### functional Type

merged type ([Details](config-definitions-mcmc_traj_plots-items-properties-functional.md))

any of

*   [Untitled string in JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots-items-properties-functional-anyof-0.md "check type definition")

*   [Untitled array in JSON schema for BenchPress config file.](config-definitions-mcmc_traj_plots-items-properties-functional-anyof-1.md "check type definition")
