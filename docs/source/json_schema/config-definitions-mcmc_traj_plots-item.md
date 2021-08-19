# mcmc_traj_plots item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item
```

This module plots the so called score values in the trajectory or the value of a given functional. The currently supported functionals are the number of edges for the graphs (size) and the graph score. The mcmc_traj_plots module has a list of objects, where each object has an id field for the algorithm object id, a burn-in field (burn_in) and a field specifying the functional to be considered (functional). Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the thinning field. The plots are saved in results/mcmc_traj_plots/ and copied to results/output/mcmc_traj_plots/.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## mcmc_traj_plots_item Type

`object` ([mcmc_traj_plots item](config-definitions-mcmc_traj_plots-item.md))

## mcmc_traj_plots_item Examples

```json
{
  "id": "omcmc_itsample-bge",
  "burn_in": 0,
  "thinning": 1,
  "functional": [
    "score",
    "size"
  ],
  "active": true
}
```

# mcmc_traj_plots_item Properties

| Property                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                           |
| :------------------------ | :-------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/id")                 |
| [burn_in](#burn_in)       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/burn_in")                       |
| [thinning](#thinning)     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/thinning")                |
| [active](#active)         | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/active")         |
| [functional](#functional) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-functional.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional") |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/id")

### id Type

`string`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/burn_in")

### burn_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## thinning



`thinning`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/thinning")

### thinning Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

    *   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## active



`active`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/active")

### active Type

`boolean`

## functional



`functional`

*   is required

*   Type: merged type ([Details](config-definitions-mcmc_traj_plots-item-properties-functional.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-functional.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional")

### functional Type

merged type ([Details](config-definitions-mcmc_traj_plots-item-properties-functional.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-functional-anyof-0.md "check type definition")

*   [Untitled array in JSON schema for Benchpress config file.](config-definitions-mcmc_traj_plots-item-properties-functional-anyof-1.md "check type definition")
