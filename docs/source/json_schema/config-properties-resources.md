# resources Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources
```

The available modules for generating graphs, parameters, data and structure learning algorithms.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## resources Type

unknown ([resources](config-properties-resources.md))

# resources Properties

| Property                                                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                         |
| :-------------------------------------------------------------- | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [data](#data)                                                   | `object` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-data.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data")                                                   |
| [graph](#graph)                                                 | `object` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-graph.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph")                                                 |
| [parameters](#parameters)                                       | `object` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters")                                       |
| [structure_learning_algorithms](#structure_learning_algorithms) | `object` | Required | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-structure_learning_algorithms.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms") |

## data

Data sampling setup.

`data`

*   is required

*   Type: `object` ([data](config-properties-resources-properties-data.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-data.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data")

### data Type

`object` ([data](config-properties-resources-properties-data.md))

### data Examples

```json
{
  "id": "standardized",
  "standardized": true,
  "sample_sizes": [
    100
  ]
}
```

```json
{
  "id": "nonstandardized",
  "standardized": false,
  "sample_sizes": [
    1000
  ]
}
```

## graph

The available graph sampling algorithms.

`graph`

*   is required

*   Type: `object` ([graph](config-properties-resources-properties-graph.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-graph.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/graph")

### graph Type

`object` ([graph](config-properties-resources-properties-graph.md))

## parameters

The available parameter sampling algorithms

`parameters`

*   is required

*   Type: `object` ([parameters](config-properties-resources-properties-parameters.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters")

### parameters Type

`object` ([parameters](config-properties-resources-properties-parameters.md))

## structure_learning_algorithms

The available structure learning algorithms

`structure_learning_algorithms`

*   is required

*   Type: `object` ([structure_learning_algorithms](config-properties-resources-properties-structure_learning_algorithms.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-structure_learning_algorithms.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms")

### structure_learning_algorithms Type

`object` ([structure_learning_algorithms](config-properties-resources-properties-structure_learning_algorithms.md))
