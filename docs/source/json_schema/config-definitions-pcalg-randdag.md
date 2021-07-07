# pcalg randDAG Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag
```

An instance of pcalg randdag. Sampling of a DAG with specified maximum averge number for parents for the nodes.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## pcalg_randdag Type

`object` ([pcalg randDAG](config-definitions-pcalg-randdag.md))

# pcalg randDAG Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                              |
| :-------------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pcalg-randdag-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/id")            |
| [n](#n)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/n")                   |
| [d](#d)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/d")                   |
| [par1](#par1)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/par1")         |
| [par2](#par2)               | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/par2")         |
| [method](#method)           | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pcalg-randdag-properties-method.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/method")    |
| [max_parents](#max_parents) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/max_parents") |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pcalg-randdag-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/id")

### id Type

`string`

## n

Non-negative integers, (0,1,2,...), or array of the same.

`n`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/n")

### n Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## d

Non-negative integers, (0,1,2,...), or array of the same.

`d`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/d")

### d Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## par1

E.g. 1.5 or \[1.6, 3.8] or null.

`par1`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/par1")

### par1 Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## par2

E.g. 1.5 or \[1.6, 3.8] or null.

`par2`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/par2")

### par2 Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## method



`method`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pcalg-randdag-properties-method.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/method")

### method Type

`string`

## max_parents



`max_parents`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_randdag/properties/max_parents")

### max_parents Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")
