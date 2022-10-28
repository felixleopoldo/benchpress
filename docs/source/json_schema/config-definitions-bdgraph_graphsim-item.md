# bdgraph\_graphsim item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim
```

BDgraph graph.sim

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## bdgraph\_graphsim Type

unknown ([bdgraph\_graphsim item](config-definitions-bdgraph_graphsim-item.md))

## bdgraph\_graphsim Examples

```json
{
  "id": "circle",
  "p": 50,
  "graph": "circle",
  "class": null,
  "size": null,
  "prob": 0.2
}
```

# bdgraph\_graphsim Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                              |
| :-------------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bdgraph_graphsim-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/id")       |
| [p](#p)         | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/p")                    |
| [prob](#prob)   | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/prob")                                |
| [graph](#graph) | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bdgraph_graphsim-item-properties-graph.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/graph") |
| [class](#class) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/class")          |
| [size](#size)   | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/size")           |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-bdgraph_graphsim-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bdgraph_graphsim-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/id")

### id Type

`string` ([ID](config-definitions-bdgraph_graphsim-item-properties-id.md))

## p

Non-negative integers, (0,1,2,...), or array of the same.

`p`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/p")

### p Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## prob

Number(s) in the range \[0,1].

`prob`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/prob")

### prob Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-flexprob-anyof-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## graph



`graph`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bdgraph_graphsim-item-properties-graph.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/graph")

### graph Type

`string`

### graph Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value          | Explanation |
| :------------- | :---------- |
| `"random"`     |             |
| `"cluster"`    |             |
| `"scale-free"` |             |
| `"hub"`        |             |
| `"circle"`     |             |
| `"star"`       |             |
| `"lattice"`    |             |

## class



`class`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/class")

### class Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## size



`size`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bdgraph_graphsim/properties/size")

### size Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

    *   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")
