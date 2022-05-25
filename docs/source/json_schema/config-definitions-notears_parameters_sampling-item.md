# notears_parameters_sampling item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling
```

Notears parameter sampling for Gaissian Bayesian networks. This requires that the adjaceny_matrix (graph) is of type notears_dag_sampling

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## notears_parameters_sampling Type

unknown ([notears_parameters_sampling item](config-definitions-notears_parameters_sampling-item.md))

# notears_parameters_sampling item Properties

| Property                                                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                   |
| :---------------------------------------------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                                   | `string` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/id")                                      |
| [edge_coefficient_range_from](#edge_coefficient_range_from) | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from") |
| [edge_coefficient_range_to](#edge_coefficient_range_to)     | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to") |

## id



`id`

*   is optional

*   Type: `string` ([ID](config-definitions-notears_parameters_sampling-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/id")

### id Type

`string` ([ID](config-definitions-notears_parameters_sampling-item-properties-id.md))

## edge_coefficient_range_from

Non-negative number

`edge_coefficient_range_from`

*   is optional

*   Type: `number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from")

### edge_coefficient_range_from Type

`number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md))

### edge_coefficient_range_from Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## edge_coefficient_range_to

Non-negative number

`edge_coefficient_range_to`

*   is optional

*   Type: `number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to")

### edge_coefficient_range_to Type

`number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md))

### edge_coefficient_range_to Constraints

**minimum**: the value of this number must greater than or equal to: `0`
