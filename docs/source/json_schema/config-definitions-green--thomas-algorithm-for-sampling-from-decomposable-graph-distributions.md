# Green & Thomas algorithm for sampling from decomposable graph distributions Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair
```

Green & Thomas algorithm for learning decomopasble graphs.
Source: Green, P. J., & Thomas, A. (2013). Sampling decomposable graphs using a Markov chain on junction trees. Biometrika, 100(1), 91-110.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## gt13\_multipair Type

`object` ([Green & Thomas algorithm for sampling from decomposable graph distributions](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions.md))

# Green & Thomas algorithm for sampling from decomposable graph distributions Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                             |
| :---------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/id")             |
| [datatype](#datatype)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-datatype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/datatype") |
| [n_samples](#n_samples) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/n_samples")                                                                         |
| [penalty](#penalty)     | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/penalty")                                                                    |
| [randomits](#randomits) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/randomits")                                                                         |
| [prior](#prior)         | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/prior")       |
| [ascore](#ascore)       | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/ascore")                                                                     |
| [bscore](#bscore)       | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/bscore")                                                                     |
| [clq](#clq)             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/clq")                                                                        |
| [sep](#sep)             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/sep")                                                                        |
| [mcmc_seed](#mcmc_seed) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13_multipair/properties/mcmc_seed")                                                                         |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/id")

### id Type

`string`

## datatype



`datatype`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-datatype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/datatype")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/n_samples")

### n_samples Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## penalty

E.g. 1.5 or \[1.6, 3.8] or null.

`penalty`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/penalty")

### penalty Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## randomits

Non-negative integers, (0,1,2,...), or array of the same.

`randomits`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/randomits")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/prior")

### prior Type

`string`

### prior Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value   | Explanation |
| :------ | :---------- |
| `"bc"`  |             |
| `"mbc"` |             |
| `"ep"`  |             |

## ascore

E.g. 1.5 or \[1.6, 3.8] or null.

`ascore`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/ascore")

### ascore Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## bscore

E.g. 1.5 or \[1.6, 3.8] or null.

`bscore`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/bscore")

### bscore Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## clq

E.g. 1.5 or \[1.6, 3.8] or null.

`clq`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/clq")

### clq Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## sep

E.g. 1.5 or \[1.6, 3.8] or null.

`sep`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/sep")

### sep Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## mcmc_seed

Non-negative integers, (0,1,2,...), or array of the same.

`mcmc_seed`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gt13\_multipair/properties/mcmc_seed")

### mcmc_seed Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
