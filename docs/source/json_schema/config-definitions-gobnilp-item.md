# gobnilp item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp
```

Gobnilp instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## gobnilp Type

`object` ([gobnilp item](config-definitions-gobnilp-item.md))

## gobnilp Examples

```json
{
  "id": "gobnilp-bge",
  "continuous": true,
  "score_type": "BGe",
  "plot": false,
  "palim": 2,
  "alpha_mu": 1,
  "alpha_omega_minus_nvars": 2,
  "alpha": null,
  "prune": true
}
```

# gobnilp item Properties

| Property                                            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                             |
| :-------------------------------------------------- | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                           | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/id")                        |
| [continuous](#continuous)                           | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-continuous.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/continuous")        |
| [score_type](#score_type)                           | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-score_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/score_type")        |
| [plot](#plot)                                       | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-plot.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/plot")                    |
| [palim](#palim)                                     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/palim")                        |
| [alpha](#alpha)                                     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/alpha")                   |
| [alpha_omega_minus_nvars](#alpha_omega_minus_nvars) | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/alpha_omega_minus_nvars") |
| [alpha_mu](#alpha_mu)                               | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/alpha_mu")                |
| [prune](#prune)                                     | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-prune.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/prune")                  |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/id")

### id Type

`string`

## continuous



`continuous`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-continuous.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/continuous")

### continuous Type

`boolean`

## score_type



`score_type`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-score_type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/score_type")

### score_type Type

`string`

### score_type Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value    | Explanation |
| :------- | :---------- |
| `"BGe"`  |             |
| `"BDeu"` |             |
| `"BIC"`  |             |

## plot



`plot`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-plot.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/plot")

### plot Type

`boolean`

## palim

Non-negative integers, (0,1,2,...), or array of the same.

`palim`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/palim")

### palim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## alpha

E.g. 1.5 or \[1.6, 3.8] or null.

`alpha`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/alpha")

### alpha Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## alpha_omega_minus_nvars



`alpha_omega_minus_nvars`

*   is optional

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/alpha_omega_minus_nvars")

### alpha_omega_minus_nvars Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [natnum type](config-definitions-natnum-type.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## alpha_mu

E.g. 1.5 or \[1.6, 3.8] or null.

`alpha_mu`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/alpha_mu")

### alpha_mu Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## prune



`prune`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-gobnilp-item-properties-prune.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/gobnilp/properties/prune")

### prune Type

`boolean`
