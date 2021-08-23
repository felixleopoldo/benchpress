# graph Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph
```

The available graph sampling algorithms.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## graph Type

`object` ([graph](config-properties-resources-properties-graph.md))

# graph Properties

| Property                              | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                 |
| :------------------------------------ | :------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [pcalg_randdag](#pcalg_randdag)       | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-pcalg_randdag.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/pcalg_randdag")       |
| [notears](#notears)                   | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-notears.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/notears")                   |
| [trilearn_cta](#trilearn_cta)         | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_cta.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_cta")         |
| [bandmat](#bandmat)                   | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/bandmat")                   |
| [rand_bandmat](#rand_bandmat)         | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-rand_bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/rand_bandmat")         |
| [bdgraph_graphsim](#bdgraph_graphsim) | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-bdgraph_graphsim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/bdgraph_graphsim") |

## pcalg_randdag

Sampling graph using randDAG from the pcalg package.

`pcalg_randdag`

*   is optional

*   Type: `object[]` ([pcalg_randdag item](config-definitions-pcalg_randdag-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-pcalg_randdag.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/pcalg_randdag")

### pcalg_randdag Type

`object[]` ([pcalg_randdag item](config-definitions-pcalg_randdag-item.md))

### pcalg_randdag Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## notears



`notears`

*   is optional

*   Type: unknown\[] ([notears_dag_sampling item](config-definitions-notears_dag_sampling-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-notears.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/notears")

### notears Type

unknown\[] ([notears_dag_sampling item](config-definitions-notears_dag_sampling-item.md))

### notears Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_cta

Sample decomposable graph using the Christmas tree algorithm (CTA) from the trilearn package.

`trilearn_cta`

*   is optional

*   Type: unknown\[] ([trilearn_cta item](config-definitions-trilearn_cta-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-trilearn_cta.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/trilearn_cta")

### trilearn_cta Type

unknown\[] ([trilearn_cta item](config-definitions-trilearn_cta-item.md))

### trilearn_cta Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bandmat

Generates a graph with band structured adjacency matrix.

`bandmat`

*   is optional

*   Type: unknown\[] ([bandmat item](config-definitions-bandmat-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/bandmat")

### bandmat Type

unknown\[] ([bandmat item](config-definitions-bandmat-item.md))

### bandmat Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## rand_bandmat

Generates a graph with band structured adjacency matrix of varying with.

`rand_bandmat`

*   is optional

*   Type: unknown\[] ([rand_bandmat item](config-definitions-rand_bandmat-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-rand_bandmat.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/rand_bandmat")

### rand_bandmat Type

unknown\[] ([rand_bandmat item](config-definitions-rand_bandmat-item.md))

### rand_bandmat Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bdgraph_graphsim

Generates an undirected graph using graph.sim from the R package BDgraph.

`bdgraph_graphsim`

*   is optional

*   Type: unknown\[] ([bdgraph_graphsim item](config-definitions-bdgraph_graphsim-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph-properties-bdgraph_graphsim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph/properties/bdgraph_graphsim")

### bdgraph_graphsim Type

unknown\[] ([bdgraph_graphsim item](config-definitions-bdgraph_graphsim-item.md))

### bdgraph_graphsim Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
