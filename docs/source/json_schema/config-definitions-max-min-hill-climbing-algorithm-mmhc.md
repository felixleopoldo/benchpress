# Max-min hill climbing algorithm (MMHC) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc
```

MMHC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## bnlearn_mmhc Type

`object` ([Max-min hill climbing algorithm (MMHC)](config-definitions-max-min-hill-climbing-algorithm-mmhc.md))

# Max-min hill climbing algorithm (MMHC) Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                               |
| :-------------- | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/id")       |
| [alpha](#alpha) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/alpha")                               |
| [test](#test)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-test.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/test")   |
| [beta](#beta)   | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/beta")                           |
| [score](#score) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-score.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/score") |
| [iss](#iss)     | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/iss")                            |
| [issmu](#issmu) | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/issmu")                          |
| [issw](#issw)   | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/issw")                           |
| [l](#l)         | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/l")                             |
| [k](#k)         | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/k")                             |
| [prior](#prior) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/prior") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/id")

### id Type

`string`

## alpha



`alpha`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## test



`test`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-test.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/test")

### test Type

`string`

### test Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value        | Explanation |
| :----------- | :---------- |
| `"mi"`       |             |
| `"mi-adf"`   |             |
| `"mc-mi"`    |             |
| `"smc-mi"`   |             |
| `"sp-mi"`    |             |
| `"mi-sh"`    |             |
| `"x2"`       |             |
| `"x2-adf"`   |             |
| `"sp-x2"`    |             |
| `"jt"`       |             |
| `"mc-jt"`    |             |
| `"smc-jt"`   |             |
| `"cor"`      |             |
| `"mc-cor"`   |             |
| `"smc-cor"`  |             |
| `"zf"`       |             |
| `"mc-zf"`    |             |
| `"smc-zf"`   |             |
| `"mi-g"`     |             |
| `"mc-mi-g"`  |             |
| `"smc-mi-g"` |             |
| `"mi-g-sh"`  |             |
| `"mi-cg"`    |             |

## beta

E.g. 1.5 or \[1.6, 3.8] or null.

`beta`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/beta")

### beta Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## score



`score`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-score.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/score")

### score Type

`string`

## iss

E.g. 1.5 or \[1.6, 3.8] or null.

`iss`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/iss")

### iss Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## issmu

E.g. 1.5 or \[1.6, 3.8] or null.

`issmu`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/issmu")

### issmu Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## issw

E.g. 1.5 or \[1.6, 3.8] or null.

`issw`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/issw")

### issw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## l



`l`

*   is optional

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/l")

### l Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## k



`k`

*   is optional

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/k")

### k Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## prior



`prior`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-prior.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_mmhc/properties/prior")

### prior Type

`string`
