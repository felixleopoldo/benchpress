# PC algorithm Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc
```

PC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## pcalg_pc Type

`object` ([PC algorithm](config-definitions-pc-algorithm.md))

# PC algorithm Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                 |
| :---------------------------- | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/id")                     |
| [alpha](#alpha)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/alpha")                     |
| [indepTest](#indeptest)       | `string`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-indeptest.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/indepTest")       |
| [numCores](#numcores)         | Merged    | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/numCores")                    |
| [verbose](#verbose)           | `boolean` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-verbose.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/verbose")           |
| [NAdelete](#nadelete)         | `boolean` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-nadelete.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/NAdelete")         |
| [mmax](#mmax)                 | Merged    | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-inf-string.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/mmax")          |
| [u2pd](#u2pd)                 | `string`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-u2pd.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/u2pd")                 |
| [skelmethod](#skelmethod)     | `string`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-skelmethod.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/skelmethod")     |
| [conservative](#conservative) | `boolean` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-conservative.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/conservative") |
| [majrule](#majrule)           | `boolean` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-majrule.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/majrule")           |
| [solveconfl](#solveconfl)     | `boolean` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-solveconfl.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/solveconfl")     |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/id")

### id Type

`string`

## alpha



`alpha`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## indepTest



`indepTest`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-indeptest.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/indepTest")

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

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/numCores")

### numCores Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## verbose



`verbose`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-verbose.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/verbose")

### verbose Type

`boolean`

## NAdelete



`NAdelete`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-nadelete.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/NAdelete")

### NAdelete Type

`boolean`

## mmax



`mmax`

*   is optional

*   Type: merged type ([Non-negative integer(s), or Inf string.](config-definitions-non-negative-integers-or-inf-string.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-inf-string.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/mmax")

### mmax Type

merged type ([Non-negative integer(s), or Inf string.](config-definitions-non-negative-integers-or-inf-string.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled string in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-inf-string-anyof-1.md "check type definition")

## u2pd



`u2pd`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-u2pd.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/u2pd")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-skelmethod.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/skelmethod")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-conservative.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/conservative")

### conservative Type

`boolean`

## majrule



`majrule`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-majrule.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/majrule")

### majrule Type

`boolean`

## solveconfl



`solveconfl`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-pc-algorithm-properties-solveconfl.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/pcalg_pc/properties/solveconfl")

### solveconfl Type

`boolean`
