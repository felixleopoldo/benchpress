# trilearn_g_inv_wishart item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_g_inv_wishart
```

Parameter setting for a graph inverse-Wishart model

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## trilearn_g_inv_wishart Type

`object` ([trilearn_g_inv_wishart item](config-definitions-trilearn_g_inv_wishart-item.md))

# trilearn_g_inv_wishart Properties

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                    |
| :---------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)   | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-trilearn_g_inv_wishart-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id") |
| [dof](#dof) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof")                            |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-trilearn_g_inv_wishart-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id")

### id Type

`string`

## dof

Non-negative number(s).

`dof`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof")

### dof Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")
