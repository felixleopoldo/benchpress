# MCMC mean graph plot Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item
```

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](config.schema.json "open original schema") |

## mcmc\_heatmaps\_item Type

unknown ([MCMC mean graph plot](config-definitions-mcmc-mean-graph-plot.md))

## mcmc\_heatmaps\_item Examples

```json
{
  "id": "omcmc_itsample-bge",
  "burn_in": 0,
  "active": true
}
```

# mcmc\_heatmaps\_item Properties

| Property             | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                 |
| :------------------- | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)            | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc-mean-graph-plot-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/id")         |
| [active](#active)    | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mcmc-mean-graph-plot-properties-active.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/active") |
| [burn\_in](#burn_in) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in")               |

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

## burn\_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in")

### burn\_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")
