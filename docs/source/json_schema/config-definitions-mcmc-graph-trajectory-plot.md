# MCMC graph trajectory plot Schema

```txt
myid#/definitions/mcmc_traj_plots_item
```

Plots the functional value of each graph in a MCMC trajctory.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## mcmc_traj_plots_item Type

`object` ([MCMC graph trajectory plot](config-definitions-mcmc-graph-trajectory-plot.md))

# mcmc_traj_plots_item Properties

| Property                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                       |
| :------------------------ | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-id.md "myid#/definitions/mcmc_traj_plots_item/properties/id")                 |
| [burn_in](#burn_in)       | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "myid#/definitions/mcmc_traj_plots_item/properties/burn_in")                               |
| [thinning](#thinning)     | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "myid#/definitions/mcmc_traj_plots_item/properties/thinning")                      |
| [active](#active)         | `boolean` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-active.md "myid#/definitions/mcmc_traj_plots_item/properties/active")         |
| [functional](#functional) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-functional.md "myid#/definitions/mcmc_traj_plots_item/properties/functional") |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-id.md "myid#/definitions/mcmc_traj_plots_item/properties/id")

### id Type

`string`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "myid#/definitions/mcmc_traj_plots_item/properties/burn_in")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "myid#/definitions/mcmc_traj_plots_item/properties/thinning")

### thinning Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## active



`active`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-active.md "myid#/definitions/mcmc_traj_plots_item/properties/active")

### active Type

`boolean`

## functional



`functional`

*   is required

*   Type: merged type ([Details](config-definitions-mcmc-graph-trajectory-plot-properties-functional.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-functional.md "myid#/definitions/mcmc_traj_plots_item/properties/functional")

### functional Type

merged type ([Details](config-definitions-mcmc-graph-trajectory-plot-properties-functional.md))

any of

*   [Untitled string in JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-functional-anyof-0.md "check type definition")

*   [Untitled array in JSON schema for BenchPress config file.](config-definitions-mcmc-graph-trajectory-plot-properties-functional-anyof-1.md "check type definition")
