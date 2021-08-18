# bidag_order_mcmc item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc
```

Order MCMC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bidag_order_mcmc Type

`object` ([bidag_order_mcmc item](config-definitions-bidag_order_mcmc-item.md))

# bidag_order_mcmc Properties

| Property                                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                            |
| :-------------------------------------------- | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                     | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/id")                                     |
| [startspace_algorithm](#startspace_algorithm) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm") |
| [plus1](#plus1)                               | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-plus1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/plus1")                               |
| [scoretype](#scoretype)                       | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-scoretype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/scoretype")                       |
| [MAP](#map)                                   | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-map.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/MAP")                                   |
| [chi](#chi)                                   | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/chi")                                           |
| [edgepf](#edgepf)                             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/edgepf")                                        |
| [am](#am)                                     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/am")                                            |
| [aw](#aw)                                     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/aw")                                            |
| [iterations](#iterations)                     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/iterations")                                    |
| [stepsave](#stepsave)                         | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/stepsave")                                      |
| [alpha](#alpha)                               | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprobnull.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/alpha")                                                         |
| [gamma](#gamma)                               | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/gamma")                                                        |
| [cpdag](#cpdag)                               | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-cpdag.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/cpdag")                               |
| [threshold](#threshold)                       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/threshold")                                                         |
| [burnin](#burnin)                             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/burnin")                                             |
| [mcmc_seed](#mcmc_seed)                       | Merged    | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/mcmc_seed")                                          |

## id

Unique identifier

`id`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/id")

### id Type

`string`

## startspace_algorithm



`startspace_algorithm`

*   is required

*   Type: merged type ([Details](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm")

### startspace_algorithm Type

merged type ([Details](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm-anyof-1.md "check type definition")

*   [Untitled array in JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-startspace_algorithm-anyof-2.md "check type definition")

## plus1



`plus1`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-plus1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/plus1")

### plus1 Type

`boolean`

## scoretype



`scoretype`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-scoretype.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/scoretype")

### scoretype Type

`string`

## MAP



`MAP`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-map.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/MAP")

### MAP Type

`boolean`

## chi

E.g. 1.5 or \[1.6, 3.8] or null.

`chi`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/chi")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/edgepf")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/am")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/aw")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/iterations")

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

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/stepsave")

### stepsave Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## alpha

Number(s) in the range \[0,1], or null.

`alpha`

*   is optional

*   Type: merged type ([flexprobnull](config-definitions-flexprobnull.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprobnull.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/alpha")

### alpha Type

merged type ([flexprobnull](config-definitions-flexprobnull.md))

any of

*   any of

    *   [prob type](config-definitions-prob-type.md "check type definition")

    *   [problist type](config-definitions-problist-type.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-flexprobnull-anyof-1.md "check type definition")

## gamma

Non-negative number(s).

`gamma`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/gamma")

### gamma Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

## cpdag



`cpdag`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bidag_order_mcmc-item-properties-cpdag.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/cpdag")

### cpdag Type

`boolean`

## threshold

Number(s) in the range \[0,1].

`threshold`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/threshold")

### threshold Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## burnin

Non-negative integers, (0,1,2,...), or array of the same.

`burnin`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/burnin")

### burnin Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## mcmc_seed

Non-negative integers, (0,1,2,...), or array of the same.

`mcmc_seed`

*   is optional

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bidag_order_mcmc/properties/mcmc_seed")

### mcmc_seed Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")
