# gcastle\_iidsimulation Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim
```

Data sampling from SEM.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## gcastle\_iidsimulation Type

`object` ([gcastle\_iidsimulation](config-definitions-gcastle_iidsim.md))

## gcastle\_iidsimulation Examples

```json
{
  "id": "gcastle_sem",
  "standardized": true,
  "method": "linear",
  "sem_type": "gauss",
  "noise_scale": 1,
  "n": [
    1000
  ]
}
```

# gcastle\_iidsimulation Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                 |
| :---------------------------- | :-------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/id")              |
| [n](#n)                       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/n")                                  |
| [method](#method)             | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-method.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/method")             |
| [sem\_type](#sem_type)        | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-sem_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/sem_type")         |
| [noise\_scale](#noise_scale)  | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/noise_scale")                                  |
| [standardized](#standardized) | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-standardized.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/standardized") |

## id



`id`

*   is required

*   Type: `string` ([Unique ID](config-definitions-gcastle_iidsim-properties-unique-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/id")

### id Type

`string` ([Unique ID](config-definitions-gcastle_iidsim-properties-unique-id.md))

## n

Non-negative integers, (0,1,2,...), or array of the same.

`n`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/n")

### n Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## method



`method`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-method.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/method")

### method Type

`string`

### method Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value         | Explanation |
| :------------ | :---------- |
| `"linear"`    |             |
| `"nonlinear"` |             |

## sem\_type



`sem_type`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-sem_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/sem_type")

### sem\_type Type

`string`

### sem\_type Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value         | Explanation |
| :------------ | :---------- |
| `"gauss"`     |             |
| `"exp"`       |             |
| `"gumbel"`    |             |
| `"uniform"`   |             |
| `"logistic"`  |             |
| `"mlp"`       |             |
| `"mim"`       |             |
| `"gp"`        |             |
| `"gp-add"`    |             |
| `"quadratic"` |             |

## noise\_scale

Non-negative number(s).

`noise_scale`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/noise_scale")

### noise\_scale Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## standardized



`standardized`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsim-properties-standardized.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsim/properties/standardized")

### standardized Type

`boolean`
