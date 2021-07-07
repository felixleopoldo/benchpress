# TABU search (parameter setting) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu
```

TABU algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## bnlearn_tabu Type

`object` ([TABU search (parameter setting)](config-definitions-tabu-search-parameter-setting.md))

# TABU search (parameter setting) Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :-------------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/id")       |
| [beta](#beta)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/beta")                                   |
| [score](#score) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-score.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/score") |
| [iss](#iss)     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/iss")                                    |
| [issmu](#issmu) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/issmu")                                  |
| [issw](#issw)   | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/issw")                    |
| [l](#l)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/l")                              |
| [k](#k)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/k")                              |
| [prior](#prior) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/prior") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/id")

### id Type

`string`

## beta

Non-negative number(s).

`beta`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/beta")

### beta Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## score



`score`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-score.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/score")

### score Type

`string`

## iss

Non-negative number(s).

`iss`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/iss")

### iss Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## issmu

Non-negative number(s).

`issmu`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/issmu")

### issmu Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## issw

E.g. 1.5 or \[1.6, 3.8] or null.

`issw`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/issw")

### issw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## l

Non-negative integers, (0,1,2,...), or array of the same.

`l`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/l")

### l Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## k

Non-negative integers, (0,1,2,...), or array of the same.

`k`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/k")

### k Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## prior



`prior`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-tabu-search-parameter-setting-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_tabu/properties/prior")

### prior Type

`string`
