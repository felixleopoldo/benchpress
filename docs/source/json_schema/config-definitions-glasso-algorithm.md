# GLasso algorithm Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso
```

GLasso instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## sklearn_glasso Type

`object` ([GLasso algorithm](config-definitions-glasso-algorithm.md))

# GLasso algorithm Properties

| Property                            | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                 |
| :---------------------------------- | :-------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                           | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/id")                           |
| [mode](#mode)                       | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-mode.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/mode")                       |
| [max_iter](#max_iter)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/max_iter")                              |
| [alpha](#alpha)                     | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/alpha")                                         |
| [tol](#tol)                         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/tol")                                           |
| [enet_tol](#enet_tol)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/enet_tol")                                      |
| [verbose](#verbose)                 | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-verbose.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/verbose")                 |
| [assume_centered](#assume_centered) | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-assume_centered.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/assume_centered") |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/id")

### id Type

`string`

## mode



`mode`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-mode.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/mode")

### mode Type

`string`

### mode Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value    | Explanation |
| :------- | :---------- |
| `"cd"`   |             |
| `"lars"` |             |

## max_iter

Non-negative integers, (0,1,2,...), or array of the same.

`max_iter`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/max_iter")

### max_iter Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## alpha

Non-negative number(s).

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## tol

Non-negative number(s).

`tol`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/tol")

### tol Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## enet_tol

Non-negative number(s).

`enet_tol`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/enet_tol")

### enet_tol Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## verbose



`verbose`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-verbose.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/verbose")

### verbose Type

`boolean`

## assume_centered



`assume_centered`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-glasso-algorithm-properties-assume_centered.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/sklearn_glasso/properties/assume_centered")

### assume_centered Type

`boolean`
