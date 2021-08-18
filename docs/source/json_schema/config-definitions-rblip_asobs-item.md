# rblip_asobs item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs
```

Blip object

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## rblip_asobs Type

`object` ([rblip_asobs item](config-definitions-rblip_asobs-item.md))

# rblip_asobs Properties

| Property                        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                    |
| :------------------------------ | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/id")        |
| [scorermethod](#scorermethod)   | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-scorermethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/scorermethod")   |
| [solvermethod](#solvermethod)   | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-solvermethod.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/solvermethod")   |
| [indeg](#indeg)                 | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/indeg")                           |
| [time](#time)                   | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/time")                                      |
| [allocated](#allocated)         | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/allocated")                       |
| [scorefunction](#scorefunction) | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rblip_asobs-item-properties-scorefunction.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/scorefunction") |
| [alpha](#alpha)                 | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/alpha")                                     |
| [cores](#cores)                 | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/cores")                           |
| [verbose](#verbose)             | `integer` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-nonnegint-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/verbose")                                  |

## id

Unique identifier for that can be used as reference in the benchmark_setup.

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

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## time

Non-negative number(s).

`time`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/time")

### time Type

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

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

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

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## verbose

Non-negative integer, 0,1,2,...

`verbose`

*   is required

*   Type: `integer` ([nonnegint type](config-definitions-nonnegint-type.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-nonnegint-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rblip_asobs/properties/verbose")

### verbose Type

`integer` ([nonnegint type](config-definitions-nonnegint-type.md))

### verbose Constraints

**minimum**: the value of this number must greater than or equal to: `0`
