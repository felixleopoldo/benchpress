# Notears DAG sampling Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling
```

Graph sampling method provided by the notears package.
Documentation: <https://github.com/jmoss20/notears>

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## notears_dag_sampling Type

unknown ([Notears DAG sampling](config-definitions-notears-dag-sampling.md))

# notears_dag_sampling Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                             |
| :---------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/id")             |
| [num_nodes](#num_nodes) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")                   |
| [num_edges](#num_edges) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")                   |
| [mean](#mean)           | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-mean.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/mean")         |
| [variance](#variance)   | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-variance.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/variance") |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-notears-dag-sampling-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/id")

### id Type

`string` ([ID](config-definitions-notears-dag-sampling-properties-id.md))

## num_nodes

Non-negative integers, (0,1,2,...), or array of the same.

`num_nodes`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")

### num_nodes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## num_edges

Non-negative integers, (0,1,2,...), or array of the same.

`num_edges`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")

### num_edges Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## mean



`mean`

*   is optional

*   Type: `number` ([Mean](config-definitions-notears-dag-sampling-properties-mean.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-mean.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/mean")

### mean Type

`number` ([Mean](config-definitions-notears-dag-sampling-properties-mean.md))

## variance



`variance`

*   is optional

*   Type: `number` ([Variance](config-definitions-notears-dag-sampling-properties-variance.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-dag-sampling-properties-variance.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_dag_sampling/properties/variance")

### variance Type

`number` ([Variance](config-definitions-notears-dag-sampling-properties-variance.md))
