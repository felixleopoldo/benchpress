# bnlearn_tabu item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu
```

TABU algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bnlearn_tabu Type

`object` ([bnlearn_tabu item](config-definitions-bnlearn_tabu-item.md))

## bnlearn_tabu Examples

```json
{
  "id": "tabu-bge",
  "score": "bge",
  "iss": 1,
  "issmu": [
    0.0001,
    0.001,
    0.01,
    0.05
  ],
  "issw": null,
  "l": 5,
  "k": 1,
  "prior": "uniform",
  "beta": 1
}
```

# bnlearn_tabu Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                      |
| :-------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_tabu-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/id")       |
| [beta](#beta)   | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/beta")                       |
| [score](#score) | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_tabu-item-properties-score.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/score") |
| [iss](#iss)     | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/iss")                        |
| [issmu](#issmu) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/issmu")                      |
| [issw](#issw)   | Merged   | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/issw")        |
| [l](#l)         | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/l")                |
| [k](#k)         | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/k")                |
| [prior](#prior) | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_tabu-item-properties-prior.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/prior") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_tabu-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/id")

### id Type

`string`

## beta

Non-negative number(s).

`beta`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/beta")

### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## score



`score`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_tabu-item-properties-score.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/score")

### score Type

`string`

## iss

Non-negative number(s).

`iss`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/iss")

### iss Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## issmu

Non-negative number(s).

`issmu`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/issmu")

### issmu Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## issw

E.g. 1.5 or \[1.6, 3.8] or null.

`issw`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/issw")

### issw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## l

Non-negative integers, (0,1,2,...), or array of the same.

`l`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/l")

### l Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## k

Non-negative integers, (0,1,2,...), or array of the same.

`k`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/k")

### k Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## prior



`prior`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_tabu-item-properties-prior.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_tabu/properties/prior")

### prior Type

`string`
