# Grow shrink (GS) algorithm (paramter setting) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs
```

Grow shrink (GS) algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bnlearn_gs Type

`object` ([Grow shrink (GS) algorithm (paramter setting)](config-definitions-grow-shrink-gs-algorithm-paramter-setting.md))

# bnlearn_gs Properties

| Property                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                            |
| :------------------------ | :-------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                 | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/id")                 |
| [alpha](#alpha)           | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/alpha")                                              |
| [test](#test)             | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-test.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/test")             |
| [B](#b)                   | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/B")                                             |
| [maxsx](#maxsx)           | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/maxsx")                                         |
| [debug](#debug)           | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-debug.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/debug")           |
| [undirected](#undirected) | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-undirected.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/undirected") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/id")

### id Type

`string`

## alpha



`alpha`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## test



`test`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-test.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/test")

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

## B



`B`

*   is required

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/B")

### B Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [Positive integer](config-definitions-positive-integer.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-1-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## maxsx



`maxsx`

*   is required

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/maxsx")

### maxsx Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [Positive integer](config-definitions-positive-integer.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-1-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## debug



`debug`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-debug.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/debug")

### debug Type

`boolean`

## undirected



`undirected`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-grow-shrink-gs-algorithm-paramter-setting-properties-undirected.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bnlearn_gs/properties/undirected")

### undirected Type

`boolean`
