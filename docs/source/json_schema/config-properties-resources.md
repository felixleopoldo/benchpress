# Resources Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources
```

Algorithms and files available for benchmarking.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## resources Type

unknown ([Resources](config-properties-resources.md))

# resources Properties

| Property                                                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                         |
| :-------------------------------------------------------------- | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [data](#data)                                                   | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-data-sampling-algorithms.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/data")                                         |
| [graph](#graph)                                                 | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-graph-sampling-algorithms.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/graph")                                       |
| [parameters](#parameters)                                       | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters")                              |
| [structure_learning_algorithms](#structure_learning_algorithms) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/structure_learning_algorithms") |

## data

Data sampling setup.

`data`

*   is required

*   Type: `object` ([Data sampling algorithms](config-properties-resources-properties-data-sampling-algorithms.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-data-sampling-algorithms.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/data")

### data Type

`object` ([Data sampling algorithms](config-properties-resources-properties-data-sampling-algorithms.md))

## graph

The available graph sampling algorithms.

`graph`

*   is required

*   Type: `object` ([Graph sampling algorithms](config-properties-resources-properties-graph-sampling-algorithms.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-graph-sampling-algorithms.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/graph")

### graph Type

`object` ([Graph sampling algorithms](config-properties-resources-properties-graph-sampling-algorithms.md))

## parameters

The available parameter sampling algorithms

`parameters`

*   is required

*   Type: `object` ([Parameters sampling algorithm](config-properties-resources-properties-parameters-sampling-algorithm.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters")

### parameters Type

`object` ([Parameters sampling algorithm](config-properties-resources-properties-parameters-sampling-algorithm.md))

## structure_learning_algorithms

The available structure learning algorithms

`structure_learning_algorithms`

*   is required

*   Type: `object` ([Available structure learning algorithms](config-properties-resources-properties-available-structure-learning-algorithms.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/structure_learning_algorithms")

### structure_learning_algorithms Type

`object` ([Available structure learning algorithms](config-properties-resources-properties-available-structure-learning-algorithms.md))
