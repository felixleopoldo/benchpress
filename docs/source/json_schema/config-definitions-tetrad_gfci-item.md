# tetrad_gfci item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci
```

GFCI instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## tetrad_gfci Type

`object` ([tetrad_gfci item](config-definitions-tetrad_gfci-item.md))

## tetrad_gfci Examples

```json
{
  "id": "gfci-sem-bic-fisher-z",
  "alpha": 0.05,
  "score": "sem-bic",
  "test": "fisher-z-test",
  "datatype": "continuous",
  "penaltyDiscount": [
    0.5,
    1,
    1.5
  ],
  "samplePrior": null,
  "structurePrior": 1,
  "timeout": null
}
```

# tetrad_gfci Properties

| Property                            | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :---------------------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                           | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/id")             |
| [alpha](#alpha)                     | Merged   | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/alpha")                                |
| [test](#test)                       | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/test")         |
| [score](#score)                     | `string` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-score.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/score")       |
| [timeout](#timeout)                 | Merged   | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/timeout")          |
| [datatype](#datatype)               | `string` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-datatype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/datatype") |
| [samplePrior](#sampleprior)         | Merged   | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/samplePrior")      |
| [structurePrior](#structureprior)   | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/structurePrior")                  |
| [penaltyDiscount](#penaltydiscount) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/penaltyDiscount")  |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/id")

### id Type

`string`

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is optional

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/alpha")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/test")

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

## score



`score`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-score.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/score")

### score Type

`string`

### score Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value              | Explanation |
| :----------------- | :---------- |
| `"bdeu-score"`     |             |
| `"cci-score"`      |             |
| `"cg-bic-score"`   |             |
| `"d-sep-score"`    |             |
| `"disc-bic-score"` |             |
| `"sem-bic"`        |             |

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## datatype



`datatype`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-tetrad_gfci-item-properties-datatype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/datatype")

### datatype Type

`string`

## samplePrior

E.g. 1.5 or \[1.6, 3.8] or null.

`samplePrior`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/samplePrior")

### samplePrior Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## structurePrior

Non-negative number(s).

`structurePrior`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/structurePrior")

### structurePrior Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## penaltyDiscount

E.g. 1.5 or \[1.6, 3.8] or null.

`penaltyDiscount`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/tetrad_gfci/properties/penaltyDiscount")

### penaltyDiscount Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
