# Random undirected graph Schema

```txt
myid#/definitions/bdgraph_graphsim
```

BDgraph graph.sim

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bdgraph_graphsim Type

unknown ([Random undirected graph](config-definitions-random-undirected-graph.md))

# bdgraph_graphsim Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                      |
| :-------------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-random-undirected-graph-properties-id.md "myid#/definitions/bdgraph_graphsim/properties/id")       |
| [p](#p)         | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "myid#/definitions/bdgraph_graphsim/properties/p")                        |
| [prob](#prob)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "myid#/definitions/bdgraph_graphsim/properties/prob")                   |
| [graph](#graph) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-random-undirected-graph-properties-graph.md "myid#/definitions/bdgraph_graphsim/properties/graph") |
| [class](#class) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "myid#/definitions/bdgraph_graphsim/properties/class")            |
| [size](#size)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "myid#/definitions/bdgraph_graphsim/properties/size")             |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-random-undirected-graph-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-random-undirected-graph-properties-id.md "myid#/definitions/bdgraph_graphsim/properties/id")

### id Type

`string` ([ID](config-definitions-random-undirected-graph-properties-id.md))

## p

Non-negative integers, (0,1,2,...), or array of the same.

`p`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "myid#/definitions/bdgraph_graphsim/properties/p")

### p Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## prob



`prob`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "myid#/definitions/bdgraph_graphsim/properties/prob")

### prob Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## graph



`graph`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-random-undirected-graph-properties-graph.md "myid#/definitions/bdgraph_graphsim/properties/graph")

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

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "myid#/definitions/bdgraph_graphsim/properties/class")

### class Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## size



`size`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "myid#/definitions/bdgraph_graphsim/properties/size")

### size Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")
