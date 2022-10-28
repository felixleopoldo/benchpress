# graph Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph
```

The available graph sampling algorithms.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## graph Type

`object` ([graph](config-properties-resources-properties-graph.md))

# graph Properties

| Property                                          | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                           |
| :------------------------------------------------ | :------ | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [pcalg\_randdag](#pcalg_randdag)                  | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-pcalg_randdag.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/pcalg_randdag")                 |
| [trilearn\_cta](#trilearn_cta)                    | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_cta.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_cta")                   |
| [trilearn\_bandmat](#trilearn_bandmat)            | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_bandmat")           |
| [trilearn\_rand\_bandmat](#trilearn_rand_bandmat) | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_rand_bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_rand_bandmat") |
| [bdgraph\_graphsim](#bdgraph_graphsim)            | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-bdgraph_graphsim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/bdgraph_graphsim")           |

## pcalg\_randdag

Sampling graph using randDAG from the pcalg package.

`pcalg_randdag`

*   is optional

*   Type: `object[]` ([pcalg\_randdag item](config-definitions-pcalg_randdag-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-pcalg_randdag.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/pcalg_randdag")

### pcalg\_randdag Type

`object[]` ([pcalg\_randdag item](config-definitions-pcalg_randdag-item.md))

### pcalg\_randdag Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn\_cta

Sample decomposable graph using the Christmas tree algorithm (CTA) from the trilearn package.

`trilearn_cta`

*   is optional

*   Type: unknown\[] ([trilearn\_cta item](config-definitions-trilearn_cta-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_cta.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_cta")

### trilearn\_cta Type

unknown\[] ([trilearn\_cta item](config-definitions-trilearn_cta-item.md))

### trilearn\_cta Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn\_bandmat

Generates a graph with band structured adjacency matrix.

`trilearn_bandmat`

*   is optional

*   Type: unknown\[] ([trilearn\_bandmat item](config-definitions-trilearn_bandmat-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_bandmat")

### trilearn\_bandmat Type

unknown\[] ([trilearn\_bandmat item](config-definitions-trilearn_bandmat-item.md))

### trilearn\_bandmat Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn\_rand\_bandmat

Generates a graph with band structured adjacency matrix of varying with.

`trilearn_rand_bandmat`

*   is optional

*   Type: unknown\[] ([trilearn\_rand\_bandmat item](config-definitions-trilearn_rand_bandmat-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_rand_bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_rand_bandmat")

### trilearn\_rand\_bandmat Type

unknown\[] ([trilearn\_rand\_bandmat item](config-definitions-trilearn_rand_bandmat-item.md))

### trilearn\_rand\_bandmat Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bdgraph\_graphsim

Generates an undirected graph using graph.sim from the R package BDgraph.

`bdgraph_graphsim`

*   is optional

*   Type: unknown\[] ([bdgraph\_graphsim item](config-definitions-bdgraph_graphsim-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-bdgraph_graphsim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/bdgraph_graphsim")

### bdgraph\_graphsim Type

unknown\[] ([bdgraph\_graphsim item](config-definitions-bdgraph_graphsim-item.md))

### bdgraph\_graphsim Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
