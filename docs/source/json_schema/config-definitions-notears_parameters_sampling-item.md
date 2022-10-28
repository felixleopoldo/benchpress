# notears\_parameters\_sampling item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling
```

Notears parameter sampling for Gaissian Bayesian networks. This requires that the adjaceny\_matrix (graph) is of type notears\_dag\_sampling

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](config.schema.json "open original schema") |

## notears\_parameters\_sampling Type

unknown ([notears\_parameters\_sampling item](config-definitions-notears_parameters_sampling-item.md))

# notears\_parameters\_sampling Properties

| Property                                                       | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                   |
| :------------------------------------------------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                                      | `string` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/id")                                      |
| [edge\_coefficient\_range\_from](#edge_coefficient_range_from) | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from") |
| [edge\_coefficient\_range\_to](#edge_coefficient_range_to)     | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to") |

## id



`id`

*   is optional

*   Type: `string` ([ID](config-definitions-notears_parameters_sampling-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/id")

### id Type

`string` ([ID](config-definitions-notears_parameters_sampling-item-properties-id.md))

## edge\_coefficient\_range\_from

Non-negative number

`edge_coefficient_range_from`

*   is optional

*   Type: `number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from")

### edge\_coefficient\_range\_from Type

`number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md))

### edge\_coefficient\_range\_from Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## edge\_coefficient\_range\_to

Non-negative number

`edge_coefficient_range_to`

*   is optional

*   Type: `number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to")

### edge\_coefficient\_range\_to Type

`number` ([nonnegnum type](config-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md))

### edge\_coefficient\_range\_to Constraints

**minimum**: the value of this number must greater than or equal to: `0`
