# Untitled undefined type in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_heatmaps/items
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## items Type

unknown

# items Properties

| Property            | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                               |
| :------------------ | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)           | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-mcmc_heatmaps-items-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_heatmaps/items/properties/id") |
| [burn_in](#burn_in) | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_heatmaps/items/properties/burn_in")        |

## id



`id`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-mcmc_heatmaps-items-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_heatmaps/items/properties/id")

### id Type

`string`

## burn_in

Non-negative integers, (0,1,2,...), or array of the same.

`burn_in`

*   is optional

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mcmc_heatmaps/items/properties/burn_in")

### burn_in Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
