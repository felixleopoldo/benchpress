# gcastle\_notears item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears
```

gcastle\_notears object

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## gcastle\_notears Type

`object` ([gcastle\_notears item](config-definitions-gcastle_notears-item.md))

## gcastle\_notears Examples

```json
{
  "id": "gcastle_notears",
  "lambda1": 0.1,
  "loss_type": "l2",
  "max_iter": 100,
  "h_tol": "1e-8",
  "rho_max": "1e+16",
  "w_threshold": 0.5,
  "timeout": null
}
```

# gcastle\_notears Properties

| Property                     | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                     |
| :--------------------------- | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                    | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/id") |
| [loss\_type](#loss_type)     | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-loss_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/loss_type")  |
| [lambda1](#lambda1)          | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/lambda1")                                |
| [max\_iter](#max_iter)       | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/max_iter")                     |
| [w\_threshold](#w_threshold) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/w_threshold")                            |
| [timeout](#timeout)          | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/timeout")                 |
| [rho\_max](#rho_max)         | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-rho_max.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/rho_max")      |
| [h\_tol](#h_tol)             | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-h_tol.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/h_tol")          |

## id

Unique identifier for that can be used as reference in the benchmark\_setup.

`id`

*   is required

*   Type: `string` ([Unique identifier](config-definitions-gcastle_notears-item-properties-unique-identifier.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/id")

### id Type

`string` ([Unique identifier](config-definitions-gcastle_notears-item-properties-unique-identifier.md))

## loss\_type



`loss_type`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-loss_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/loss_type")

### loss\_type Type

`string`

## lambda1

Non-negative number(s).

`lambda1`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/lambda1")

### lambda1 Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## max\_iter

Non-negative integers, (0,1,2,...), or array of the same.

`max_iter`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/max_iter")

### max\_iter Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## w\_threshold

Non-negative number(s).

`w_threshold`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/w_threshold")

### w\_threshold Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## rho\_max



`rho_max`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-rho_max.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/rho_max")

### rho\_max Type

`string`

## h\_tol



`h_tol`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_notears-item-properties-h_tol.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_notears/properties/h_tol")

### h\_tol Type

`string`
