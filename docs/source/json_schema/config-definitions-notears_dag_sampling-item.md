# notears\_dag\_sampling item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling
```

Graph sampling method provided by the notears package.
Documentation: <https://github.com/jmoss20/notears>

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## notears\_dag\_sampling Type

unknown ([notears\_dag\_sampling item](config-definitions-notears_dag_sampling-item.md))

# notears\_dag\_sampling Properties

| Property                 | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                            |
| :----------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_dag_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/id")             |
| [num\_nodes](#num_nodes) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")                      |
| [num\_edges](#num_edges) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")                      |
| [mean](#mean)            | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_dag_sampling-item-properties-mean.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/mean")         |
| [variance](#variance)    | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_dag_sampling-item-properties-variance.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/variance") |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-notears_dag_sampling-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_dag_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/id")

### id Type

`string` ([ID](config-definitions-notears_dag_sampling-item-properties-id.md))

## num\_nodes

Non-negative integers, (0,1,2,...), or array of the same.

`num_nodes`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")

### num\_nodes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## num\_edges

Non-negative integers, (0,1,2,...), or array of the same.

`num_edges`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")

### num\_edges Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## mean



`mean`

*   is optional

*   Type: `number` ([Mean](config-definitions-notears_dag_sampling-item-properties-mean.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_dag_sampling-item-properties-mean.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/mean")

### mean Type

`number` ([Mean](config-definitions-notears_dag_sampling-item-properties-mean.md))

## variance



`variance`

*   is optional

*   Type: `number` ([Variance](config-definitions-notears_dag_sampling-item-properties-variance.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_dag_sampling-item-properties-variance.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/variance")

### variance Type

`number` ([Variance](config-definitions-notears_dag_sampling-item-properties-variance.md))
