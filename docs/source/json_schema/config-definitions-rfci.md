# RFCI Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci
```

RFCI instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## tetrad_rfci Type

`object` ([RFCI](config-definitions-rfci.md))

# tetrad_rfci Properties

| Property              | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                              |
| :-------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/id")             |
| [alpha](#alpha)       | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/alpha")     |
| [test](#test)         | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/test")         |
| [datatype](#datatype) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-rfci-properties-datatype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/datatype") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/id")

### id Type

`string`

## alpha



`alpha`

*   is optional

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## test



`test`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/test")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-rfci-properties-datatype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_rfci/properties/datatype")

### datatype Type

`string`