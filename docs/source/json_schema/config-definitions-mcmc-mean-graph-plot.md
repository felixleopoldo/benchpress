# MCMC mean graph plot Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item
```

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## mcmc_heatmaps_item Type

unknown ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

## mcmc_heatmaps_item Examples

```json
{
  "id": "omcmc_itsample-bge",
  "burn_in": 0,
  "active": true
}
```

# mcmc_heatmaps_item Properties

| Property            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                 |
| :------------------ | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)           | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc-mean-graph-plot-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/id")         |
| [active](#active)   | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc-mean-graph-plot-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/active") |
| [burn_in](#burn_in) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in")               |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc-mean-graph-plot-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/id")

### id Type

`string`

## active

Set to false if you dont want to plot it.

`active`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mcmc-mean-graph-plot-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/active")

### active Type

`boolean`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in")

### burn_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")
