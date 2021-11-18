# pcalg_randdag item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag
```

An instance of pcalg randdag. Sampling of a DAG with specified maximum averge number for parents for the nodes.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## pcalg_randdag Type

`object` ([pcalg_randdag item](config-definitions-pcalg_randdag-item.md))

# pcalg_randdag Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :-------------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_randdag-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/id")         |
| [n](#n)                     | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/n")                   |
| [d](#d)                     | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/d")                   |
| [par1](#par1)               | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/par1")           |
| [par2](#par2)               | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/par2")           |
| [method](#method)           | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_randdag-item-properties-method.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/method") |
| [max_parents](#max_parents) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/max_parents")   |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_randdag-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/id")

### id Type

`string`

## n

Non-negative integers, (0,1,2,...), or array of the same.

`n`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/n")

### n Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## d

Non-negative integers, (0,1,2,...), or array of the same.

`d`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/d")

### d Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## par1

E.g. 1.5 or \[1.6, 3.8] or null.

`par1`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/par1")

### par1 Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## par2

E.g. 1.5 or \[1.6, 3.8] or null.

`par2`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/par2")

### par2 Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## method



`method`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_randdag-item-properties-method.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/method")

### method Type

`string`

## max_parents



`max_parents`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_randdag/properties/max_parents")

### max_parents Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")
