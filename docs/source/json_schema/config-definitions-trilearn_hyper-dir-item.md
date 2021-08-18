# trilearn_hyper-dir item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir
```

Parameter setting for a hyper Dirichlet distribution

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## trilearn_hyper-dir Type

`object` ([trilearn_hyper-dir item](config-definitions-trilearn_hyper-dir-item.md))

# trilearn_hyper-dir Properties

| Property                  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                            |
| :------------------------ | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                 | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-trilearn_hyper-dir-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir/properties/id") |
| [n_levels](#n_levels)     | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir/properties/n_levels")         |
| [pseudo_obs](#pseudo_obs) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir/properties/pseudo_obs")                 |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-trilearn_hyper-dir-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir/properties/id")

### id Type

`string`

## n_levels

Non-negative integers, (0,1,2,...), or array of the same.

`n_levels`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir/properties/n_levels")

### n_levels Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## pseudo_obs

Non-negative number(s).

`pseudo_obs`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_hyper-dir/properties/pseudo_obs")

### pseudo_obs Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")
