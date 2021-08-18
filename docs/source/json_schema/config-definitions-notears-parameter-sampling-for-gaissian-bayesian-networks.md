# Notears parameter sampling for Gaissian Bayesian networks Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling
```

Notears parameter sampling for Gaissian Bayesian networks. This requires that the adjaceny_matrix (graph) is of type notears_dag_sampling

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## notears_parameters_sampling Type

unknown ([Notears parameter sampling for Gaissian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md))

# notears_parameters_sampling Properties

| Property                                                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                       |
| :---------------------------------------------------------- | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/id")                                           |
| [edge_coefficient_range_from](#edge_coefficient_range_from) | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from") |
| [edge_coefficient_range_to](#edge_coefficient_range_to)     | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to") |

## id



`id`

*   is optional

*   Type: `string` ([ID](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/id")

### id Type

`string` ([ID](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-id.md))

## edge_coefficient_range_from

Non-negative number

`edge_coefficient_range_from`

*   is optional

*   Type: `number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from")

### edge_coefficient_range_from Type

`number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number.md))

### edge_coefficient_range_from Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## edge_coefficient_range_to

Non-negative number

`edge_coefficient_range_to`

*   is optional

*   Type: `number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to")

### edge_coefficient_range_to Type

`number` ([Non-negative number](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks-properties-non-negative-number-1.md))

### edge_coefficient_range_to Constraints

**minimum**: the value of this number must greater than or equal to: `0`
