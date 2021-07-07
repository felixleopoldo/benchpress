# Parameters sampling algorithm Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters
```

The available parameter sampling algorithms

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## parameters Type

`object` ([Parameters sampling algorithm](config-properties-resources-properties-parameters-sampling-algorithm.md))

# Parameters sampling algorithm Properties

| Property                                                    | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                           |
| :---------------------------------------------------------- | :------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bin_bn](#bin_bn)                                           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-bin_bn.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/bin_bn")                                            |
| [notears_parameters_sampling](#notears_parameters_sampling) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-notears-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling")          |
| [sem_params](#sem_params)                                   | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-sem_params-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/sem_params")                        |
| [trilearn_hyper-dir](#trilearn_hyper-dir)                   | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-hyper-dirichlet-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")           |
| [trilearn_intra-class](#trilearn_intra-class)               | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-graph-intra-class-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class")       |
| [trilearn_g_inv_wishart](#trilearn_g_inv_wishart)           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-graph-inverse-wishart-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart") |
| Additional Properties                                       | Any     | Optional | can be null    |                                                                                                                                                                                                                                                                                                                      |

## bin_bn

List of generateBinayBN instantiations

`bin_bn`

*   is optional

*   Type: `object[]` ([bin_bn](config-definitions-bin_bn.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-bin_bn.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/bin_bn")

### bin_bn Type

`object[]` ([bin_bn](config-definitions-bin_bn.md))

### bin_bn Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## notears_parameters_sampling

List of notears id's

`notears_parameters_sampling`

*   is optional

*   Type: unknown\[] ([Notears parameter sampling for Gaissian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-notears-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling")

### notears_parameters_sampling Type

unknown\[] ([Notears parameter sampling for Gaissian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md))

### notears_parameters_sampling Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## sem_params

List of sem_params id's

`sem_params`

*   is optional

*   Type: `object[]` ([PCalg SEM params](config-definitions-pcalg-sem-params.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-sem_params-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/sem_params")

### sem_params Type

`object[]` ([PCalg SEM params](config-definitions-pcalg-sem-params.md))

### sem_params Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_hyper-dir

List of trilearn_hyper-dir id's

`trilearn_hyper-dir`

*   is optional

*   Type: `object[]` ([Hyper-Dirichlet](config-definitions-hyper-dirichlet.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-hyper-dirichlet-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")

### trilearn_hyper-dir Type

`object[]` ([Hyper-Dirichlet](config-definitions-hyper-dirichlet.md))

### trilearn_hyper-dir Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_intra-class

List of intra-class id's

`trilearn_intra-class`

*   is optional

*   Type: `object[]` ([Graph intra-class model](config-definitions-graph-intra-class-model.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-graph-intra-class-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class")

### trilearn_intra-class Type

`object[]` ([Graph intra-class model](config-definitions-graph-intra-class-model.md))

### trilearn_intra-class Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_g_inv_wishart

List of graph inverse-Wishart id's

`trilearn_g_inv_wishart`

*   is optional

*   Type: `object[]` ([Graph graph inverse-Wishart model](config-definitions-graph-graph-inverse-wishart-model.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-graph-inverse-wishart-ids.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart")

### trilearn_g_inv_wishart Type

`object[]` ([Graph graph inverse-Wishart model](config-definitions-graph-graph-inverse-wishart-model.md))

### trilearn_g_inv_wishart Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## Additional Properties

Additional properties are allowed and do not have to follow a specific schema
