# bidag\_partition\_mcmc item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc
```

Partition MCMC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## bidag\_partition\_mcmc Type

`object` ([bidag\_partition\_mcmc item](config-definitions-bidag_partition_mcmc-item.md))

## bidag\_partition\_mcmc Examples

```json
{
  "id": "partition_itmap-bge",
  "startspace_algorithm": "itsearch_map-bge_am01_endspace",
  "verbose": true,
  "scoretype": "bge",
  "chi": null,
  "edgepf": null,
  "aw": null,
  "am": [
    0.01,
    0.1,
    0.05
  ],
  "gamma": 1,
  "stepsave": null,
  "iterations": null,
  "timeout": null,
  "mcmc_seed": 1,
  "burnin": 0
}
```

# bidag\_partition\_mcmc Properties

| Property                                       | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                    |
| :--------------------------------------------- | :-------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                      | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/id")                                     |
| [startspace\_algorithm](#startspace_algorithm) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/startspace_algorithm") |
| [scoretype](#scoretype)                        | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-scoretype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/scoretype")                       |
| [verbose](#verbose)                            | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-verbose.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/verbose")                           |
| [chi](#chi)                                    | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/chi")                                               |
| [edgepf](#edgepf)                              | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/edgepf")                                            |
| [am](#am)                                      | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/am")                                                |
| [aw](#aw)                                      | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/aw")                                                |
| [iterations](#iterations)                      | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/iterations")                                        |
| [stepsave](#stepsave)                          | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/stepsave")                                          |
| [gamma](#gamma)                                | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/gamma")                                                            |
| [burnin](#burnin)                              | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/burnin")                                                 |
| [mcmc\_seed](#mcmc_seed)                       | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/mcmc_seed")                                              |
| [timeout](#timeout)                            | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/timeout")                                           |

## id

Unique identifier

`id`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/id")

### id Type

`string`

## startspace\_algorithm



`startspace_algorithm`

*   is required

*   Type: merged type ([Details](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/startspace_algorithm")

### startspace\_algorithm Type

merged type ([Details](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm-anyof-1.md "check type definition")

*   [Untitled array in JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-startspace_algorithm-anyof-2.md "check type definition")

## scoretype



`scoretype`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-scoretype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/scoretype")

### scoretype Type

`string`

## verbose



`verbose`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_partition_mcmc-item-properties-verbose.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/verbose")

### verbose Type

`boolean`

## chi

E.g. 1.5 or \[1.6, 3.8] or null.

`chi`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/chi")

### chi Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## edgepf

E.g. 1.5 or \[1.6, 3.8] or null.

`edgepf`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/edgepf")

### edgepf Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## am

E.g. 1.5 or \[1.6, 3.8] or null.

`am`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/am")

### am Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## aw

E.g. 1.5 or \[1.6, 3.8] or null.

`aw`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/aw")

### aw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## iterations

E.g. 1.5 or \[1.6, 3.8] or null.

`iterations`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/iterations")

### iterations Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## stepsave

E.g. 1.5 or \[1.6, 3.8] or null.

`stepsave`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/stepsave")

### stepsave Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## gamma

Non-negative number(s).

`gamma`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/gamma")

### gamma Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## burnin

Non-negative integers, (0,1,2,...), or array of the same.

`burnin`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/burnin")

### burnin Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## mcmc\_seed

Non-negative integers, (0,1,2,...), or array of the same.

`mcmc_seed`

*   is optional

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/mcmc_seed")

### mcmc\_seed Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is optional

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_partition_mcmc/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
