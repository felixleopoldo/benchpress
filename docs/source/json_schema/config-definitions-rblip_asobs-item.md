# rblip\_asobs item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs
```

Blip object

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## rblip\_asobs Type

`object` ([rblip\_asobs item](config-definitions-rblip_asobs-item.md))

## rblip\_asobs Examples

```json
{
  "id": "winasobs-bdeu",
  "scorermethod": "is",
  "solvermethod": "winasobs",
  "indeg": 80,
  "timeout": 180,
  "allocated": 80,
  "scorefunction": "bdeu",
  "alpha": [
    0.001,
    0.01,
    0.1
  ],
  "cores": 1,
  "verbose_level": 0
}
```

# rblip\_asobs Properties

| Property                         | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                    |
| :------------------------------- | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                        | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/id")        |
| [scorermethod](#scorermethod)    | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-scorermethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/scorermethod")   |
| [solvermethod](#solvermethod)    | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-solvermethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/solvermethod")   |
| [indeg](#indeg)                  | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/indeg")                           |
| [timeout](#timeout)              | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/timeout")                                   |
| [allocated](#allocated)          | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/allocated")                       |
| [scorefunction](#scorefunction)  | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-scorefunction.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/scorefunction") |
| [alpha](#alpha)                  | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/alpha")                                     |
| [cores](#cores)                  | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/cores")                           |
| [verbose\_level](#verbose_level) | `integer` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-nonnegint-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/verbose_level")                            |

## id

Unique identifier for that can be used as reference in the benchmark\_setup.

`id`

*   is required

*   Type: `string` ([Unique identifier](config-definitions-rblip_asobs-item-properties-unique-identifier.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/id")

### id Type

`string` ([Unique identifier](config-definitions-rblip_asobs-item-properties-unique-identifier.md))

## scorermethod



`scorermethod`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-scorermethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/scorermethod")

### scorermethod Type

`string`

## solvermethod



`solvermethod`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-solvermethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/solvermethod")

### solvermethod Type

`string`

## indeg

Non-negative integers, (0,1,2,...), or array of the same.

`indeg`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/indeg")

### indeg Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## timeout

Non-negative number(s).

`timeout`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/timeout")

### timeout Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## allocated

Non-negative integers, (0,1,2,...), or array of the same.

`allocated`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/allocated")

### allocated Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## scorefunction



`scorefunction`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-scorefunction.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/scorefunction")

### scorefunction Type

`string`

## alpha

Non-negative number(s).

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## cores

Non-negative integers, (0,1,2,...), or array of the same.

`cores`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/cores")

### cores Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## verbose\_level

Non-negative integer, 0,1,2,...

`verbose_level`

*   is required

*   Type: `integer` ([nonnegint type](config-definitions-nonnegint-type.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-nonnegint-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/verbose_level")

### verbose\_level Type

`integer` ([nonnegint type](config-definitions-nonnegint-type.md))

### verbose\_level Constraints

**minimum**: the value of this number must greater than or equal to: `0`
