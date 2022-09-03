# Greedy Sparsest Permutations (GSP) Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp
```

This is the Greedy Sparsest Permutations (GSP) algorithm from the causalDAG package, <https://uhlerlab.github.io/causaldag/>. For information about the arguments please see the documentation. Note that some of them are not available here yet.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## causaldag_gsp Type

`object` ([Greedy Sparsest Permutations (GSP)](config-definitions-greedy-sparsest-permutations-gsp.md))

## causaldag_gsp Examples

```json
{
  "id": "gsp",
  "nruns": 5,
  "depth": 4,
  "verbose": true,
  "initial_undirected": "threshold",
  "use_lowest": true,
  "max_iters": "inf",
  "factor": 2,
  "progress_bar": false,
  "summarize": false,
  "alpha": [
    0.05,
    0.001
  ],
  "invert": true,
  "timeout": null
}
```

# Greedy Sparsest Permutations (GSP) Properties

| Property                                  | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                |
| :---------------------------------------- | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                                 | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/id")                  |
| [nruns](#nruns)                           | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/nruns")                                                     |
| [depth](#depth)                           | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/depth")                                                     |
| [verbose](#verbose)                       | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-verbose.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/verbose")                       |
| [initial_undirected](#initial_undirected) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-initial_undirected.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/initial_undirected") |
| [use_lowest](#use_lowest)                 | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-use_lowest.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/use_lowest")                 |
| [factor](#factor)                         | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/factor")                                                    |
| [progress_bar](#progress_bar)             | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-progress_bar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/progress_bar")             |
| [max_iters](#max_iters)                   | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-max_iters.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/max_iters")                   |
| [summarize](#summarize)                   | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-summarize.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/summarize")                   |
| [alpha](#alpha)                           | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprobnull.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/alpha")                                                                |
| [invert](#invert)                         | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-invert.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/invert")                         |
| [timeout](#timeout)                       | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/timeout")                                              |

## id

Unique identifier for that can be used as reference in the benchmark_setup.

`id`

*   is required

*   Type: `string` ([Unique identifier](config-definitions-greedy-sparsest-permutations-gsp-properties-unique-identifier.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-unique-identifier.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/id")

### id Type

`string` ([Unique identifier](config-definitions-greedy-sparsest-permutations-gsp-properties-unique-identifier.md))

## nruns

Non-negative integers, (0,1,2,...), or array of the same.

`nruns`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/nruns")

### nruns Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## depth

Non-negative integers, (0,1,2,...), or array of the same.

`depth`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/depth")

### depth Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## verbose



`verbose`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-verbose.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/verbose")

### verbose Type

`boolean`

## initial_undirected



`initial_undirected`

*   is required

*   Type: merged type ([Details](config-definitions-greedy-sparsest-permutations-gsp-properties-initial_undirected.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-initial_undirected.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/initial_undirected")

### initial_undirected Type

merged type ([Details](config-definitions-greedy-sparsest-permutations-gsp-properties-initial_undirected.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-initial_undirected-anyof-0.md "check type definition")

## use_lowest



`use_lowest`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-use_lowest.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/use_lowest")

### use_lowest Type

`boolean`

## factor

Non-negative integers, (0,1,2,...), or array of the same.

`factor`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/factor")

### factor Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## progress_bar



`progress_bar`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-progress_bar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/progress_bar")

### progress_bar Type

`boolean`

## max_iters



`max_iters`

*   is required

*   Type: merged type ([Details](config-definitions-greedy-sparsest-permutations-gsp-properties-max_iters.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-max_iters.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/max_iters")

### max_iters Type

merged type ([Details](config-definitions-greedy-sparsest-permutations-gsp-properties-max_iters.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-max_iters-anyof-0.md "check type definition")

*   any of

    *   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## summarize



`summarize`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-summarize.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/summarize")

### summarize Type

`boolean`

## alpha

Number(s) in the range \[0,1], or null.

`alpha`

*   is required

*   Type: merged type ([flexprobnull](config-definitions-flexprobnull.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprobnull.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/alpha")

### alpha Type

merged type ([flexprobnull](config-definitions-flexprobnull.md))

any of

*   any of

    *   [prob type](config-definitions-prob-type.md "check type definition")

    *   [problist type](config-definitions-problist-type.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-flexprobnull-anyof-1.md "check type definition")

## invert



`invert`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-greedy-sparsest-permutations-gsp-properties-invert.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/invert")

### invert Type

`boolean`

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/causaldag_gsp/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
