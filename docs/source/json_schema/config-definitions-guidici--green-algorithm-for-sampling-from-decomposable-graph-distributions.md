# Guidici & Green algorithm for sampling from decomposable graph distributions Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair
```

Guidici & Green algorithm for learning decomopasble graphs.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## gg99\_singlepair Type

`object` ([Guidici & Green algorithm for sampling from decomposable graph distributions](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions.md))

# gg99\_singlepair Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                               |
| :---------------------- | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/id")             |
| [datatype](#datatype)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-properties-datatype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/datatype") |
| [n_samples](#n_samples) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/n_samples")                                                                          |
| [penalty](#penalty)     | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/penalty")                                                                                    |
| [randomits](#randomits) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/randomits")                                                                          |
| [prior](#prior)         | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/prior")       |
| [ascore](#ascore)       | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/ascore")                                                                                     |
| [bscore](#bscore)       | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/bscore")                                                                                     |
| [clq](#clq)             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/clq")                                                                                        |
| [sep](#sep)             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/sep")                                                                                        |
| [mcmc_seed](#mcmc_seed) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair/properties/mcmc_seed")                                                                          |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/id")

### id Type

`string`

## datatype



`datatype`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-properties-datatype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/datatype")

### datatype Type

`string`

### datatype Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value          | Explanation |
| :------------- | :---------- |
| `"discrete"`   |             |
| `"continuous"` |             |

## n_samples

Non-negative integers, (0,1,2,...), or array of the same.

`n_samples`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/n_samples")

### n_samples Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## penalty

Non-negative number(s).

`penalty`

*   is optional

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/penalty")

### penalty Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## randomits

Non-negative integers, (0,1,2,...), or array of the same.

`randomits`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/randomits")

### randomits Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## prior



`prior`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/prior")

### prior Type

`string`

## ascore

Non-negative number(s).

`ascore`

*   is optional

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/ascore")

### ascore Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## bscore

Non-negative number(s).

`bscore`

*   is optional

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/bscore")

### bscore Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## clq

Non-negative number(s).

`clq`

*   is optional

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/clq")

### clq Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## sep

Non-negative number(s).

`sep`

*   is optional

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/sep")

### sep Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## mcmc_seed

Non-negative integers, (0,1,2,...), or array of the same.

`mcmc_seed`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair/properties/mcmc_seed")

### mcmc_seed Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
