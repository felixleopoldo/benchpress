# giudice_dualpc item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc
```

Dual PC algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## giudice_dualpc Type

`object` ([giudice_dualpc item](config-definitions-giudice_dualpc-item.md))

## giudice_dualpc Examples

```json
{
  "id": "dualpc",
  "alpha": [
    0.001,
    0.01,
    0.05,
    0.1
  ],
  "skeleton": false,
  "max_ord": null,
  "timeout": null
}
```

# giudice_dualpc Properties

| Property                        | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                          |
| :------------------------------ | :-------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-giudice_dualpc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/id")                       |
| [alpha](#alpha)                 | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/alpha")                                             |
| [max_ord](#max_ord)             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/max_ord")                      |
| [skeleton](#skeleton)           | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-giudice_dualpc-item-properties-skeleton.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/skeleton")           |
| [pattern_graph](#pattern_graph) | `boolean` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-giudice_dualpc-item-properties-pattern_graph.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/pattern_graph") |
| [timeout](#timeout)             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/timeout")                       |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-giudice_dualpc-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/id")

### id Type

`string`

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## max_ord



`max_ord`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/max_ord")

### max_ord Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## skeleton



`skeleton`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-giudice_dualpc-item-properties-skeleton.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/skeleton")

### skeleton Type

`boolean`

## pattern_graph



`pattern_graph`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-giudice_dualpc-item-properties-pattern_graph.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/pattern_graph")

### pattern_graph Type

`boolean`

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/giudice_dualpc/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
