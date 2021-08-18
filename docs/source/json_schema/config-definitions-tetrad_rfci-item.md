# tetrad_rfci item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci
```

RFCI instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## tetrad_rfci Type

`object` ([tetrad_rfci item](config-definitions-tetrad_rfci-item.md))

# tetrad_rfci Properties

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :-------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)             | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_rfci-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/id")             |
| [alpha](#alpha)       | Merged   | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/alpha")                                |
| [test](#test)         | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_rfci-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/test")         |
| [datatype](#datatype) | `string` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_rfci-item-properties-datatype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/datatype") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_rfci-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/id")

### id Type

`string`

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is optional

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## test



`test`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_rfci-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/test")

### test Type

`string`

### test Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value               | Explanation |
| :------------------ | :---------- |
| `"bdeu-test"`       |             |
| `"cci-test"`        |             |
| `"cg-lr-test"`      |             |
| `"chi-square-test"` |             |
| `"d-sep-test"`      |             |
| `"disc-bic-test"`   |             |
| `"fisher-z-test"`   |             |
| `"g-square-test"`   |             |
| `"kci-test"`        |             |
| `"prob-test"`       |             |

## datatype



`datatype`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_rfci-item-properties-datatype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/datatype")

### datatype Type

`string`
