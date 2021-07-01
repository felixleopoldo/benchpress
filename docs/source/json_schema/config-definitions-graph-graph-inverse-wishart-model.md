# Graph graph inverse-Wishart model Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_g_inv_wishart
```

Parameter setting for a graph inverse-Wishart model

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## trilearn_g_inv_wishart Type

`object` ([Graph graph inverse-Wishart model](config-definitions-graph-graph-inverse-wishart-model.md))

# trilearn_g_inv_wishart Properties

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                |
| :---------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-graph-graph-inverse-wishart-model-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id") |
| [dof](#dof) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof")                                  |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-graph-graph-inverse-wishart-model-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id")

### id Type

`string`

## dof

Non-negative number(s).

`dof`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof")

### dof Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
