# gcastle_iidsimulation Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation
```

Data sampling from SEM.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## gcastle_iidsimulation Type

`object` ([gcastle_iidsimulation](config-definitions-gcastle_iidsimulation.md))

## gcastle_iidsimulation Examples

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

# gcastle_iidsimulation Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                 |
| :---------------------------- | :-------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/id")              |
| [n](#n)                       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/n")                                  |
| [method](#method)             | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-method.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/method")             |
| [sem_type](#sem_type)         | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-sem_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/sem_type")         |
| [noise_scale](#noise_scale)   | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/noise_scale")                                  |
| [standardized](#standardized) | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-standardized.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/standardized") |

## id



`id`

*   is required

*   Type: `string` ([Unique ID](config-definitions-gcastle_iidsimulation-properties-unique-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/id")

### id Type

`string` ([Unique ID](config-definitions-gcastle_iidsimulation-properties-unique-id.md))

## n

Non-negative integers, (0,1,2,...), or array of the same.

`n`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/n")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-method.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/method")

### method Type

`string`

### method Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value         | Explanation |
| :------------ | :---------- |
| `"linear"`    |             |
| `"nonlinear"` |             |

## sem_type



`sem_type`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-sem_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/sem_type")

### sem_type Type

`string`

### sem_type Constraints

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

## noise_scale

Non-negative number(s).

`noise_scale`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/noise_scale")

### noise_scale Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## standardized



`standardized`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gcastle_iidsimulation-properties-standardized.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gcastle_iidsimulation/properties/standardized")

### standardized Type

`boolean`
