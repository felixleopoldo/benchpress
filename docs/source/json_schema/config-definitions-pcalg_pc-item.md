# pcalg_pc item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc
```

PC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## pcalg_pc Type

`object` ([pcalg_pc item](config-definitions-pcalg_pc-item.md))

## pcalg_pc Examples

```json
{
  "id": "pc-gaussCItest",
  "alpha": [
    0.001,
    0.01,
    0.05,
    0.1
  ],
  "NAdelete": true,
  "mmax": "Inf",
  "u2pd": "relaxed",
  "skelmethod": "stable",
  "conservative": false,
  "majrule": false,
  "solveconfl": false,
  "numCores": 1,
  "verbose": false,
  "indepTest": "gaussCItest",
  "timeout": null
}
```

# pcalg_pc Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                            |
| :---------------------------- | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                     | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/id")                     |
| [alpha](#alpha)               | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/alpha")                                     |
| [indepTest](#indeptest)       | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-indeptest.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/indepTest")       |
| [numCores](#numcores)         | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/numCores")                   |
| [verbose](#verbose)           | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-verbose.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/verbose")           |
| [NAdelete](#nadelete)         | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-nadelete.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/NAdelete")         |
| [mmax](#mmax)                 | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegintstring.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/mmax")                           |
| [u2pd](#u2pd)                 | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-u2pd.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/u2pd")                 |
| [skelmethod](#skelmethod)     | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-skelmethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/skelmethod")     |
| [conservative](#conservative) | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-conservative.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/conservative") |
| [majrule](#majrule)           | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-majrule.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/majrule")           |
| [solveconfl](#solveconfl)     | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-solveconfl.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/solveconfl")     |
| [timeout](#timeout)           | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/timeout")               |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/id")

### id Type

`string`

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## indepTest



`indepTest`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-indeptest.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/indepTest")

### indepTest Type

`string`

### indepTest Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value           | Explanation |
| :-------------- | :---------- |
| `"binCItest"`   |             |
| `"gaussCItest"` |             |
| `"dsepTest"`    |             |
| `"disCItest"`   |             |

## numCores

Non-negative integers, (0,1,2,...), or array of the same.

`numCores`

*   is optional

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/numCores")

### numCores Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## verbose



`verbose`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-verbose.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/verbose")

### verbose Type

`boolean`

## NAdelete



`NAdelete`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-nadelete.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/NAdelete")

### NAdelete Type

`boolean`

## mmax

Non-negative integer(s), or Inf string.

`mmax`

*   is optional

*   Type: merged type ([flexnonnegintstring](config-definitions-flexnonnegintstring.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegintstring.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/mmax")

### mmax Type

merged type ([flexnonnegintstring](config-definitions-flexnonnegintstring.md))

any of

*   any of

    *   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-flexnonnegintstring-anyof-1.md "check type definition")

## u2pd



`u2pd`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-u2pd.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/u2pd")

### u2pd Type

`string`

### u2pd Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value       | Explanation |
| :---------- | :---------- |
| `"relaxed"` |             |
| `"rand"`    |             |
| `"retry"`   |             |

## skelmethod



`skelmethod`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-skelmethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/skelmethod")

### skelmethod Type

`string`

### skelmethod Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value           | Explanation |
| :-------------- | :---------- |
| `"stable"`      |             |
| `"original"`    |             |
| `"stable.fast"` |             |

## conservative



`conservative`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-conservative.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/conservative")

### conservative Type

`boolean`

## majrule



`majrule`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-majrule.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/majrule")

### majrule Type

`boolean`

## solveconfl



`solveconfl`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-pcalg_pc-item-properties-solveconfl.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/solveconfl")

### solveconfl Type

`boolean`

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/pcalg_pc/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
