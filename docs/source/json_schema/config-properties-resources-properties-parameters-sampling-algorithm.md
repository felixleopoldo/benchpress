# Parameters sampling algorithm Schema

```txt
myid#/properties/resources/properties/parameters
```

The available parameter sampling algorithms

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## parameters Type

`object` ([Parameters sampling algorithm](config-properties-resources-properties-parameters-sampling-algorithm.md))

# parameters Properties

| Property                                                    | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                          |
| :---------------------------------------------------------- | :------ | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bin_bn](#bin_bn)                                           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-bin_bn.md "myid#/properties/resources/properties/parameters/properties/bin_bn")                                           |
| [notears_parameters_sampling](#notears_parameters_sampling) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-notears_parameters_sampling.md "myid#/properties/resources/properties/parameters/properties/notears_parameters_sampling") |
| [sem_params](#sem_params)                                   | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-sem_params.md "myid#/properties/resources/properties/parameters/properties/sem_params")                                   |
| [trilearn_hyper-dir](#trilearn_hyper-dir)                   | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-trilearn_hyper-dir.md "myid#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")                   |
| [trilearn_intra-class](#trilearn_intra-class)               | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-trilearn_intra-class.md "myid#/properties/resources/properties/parameters/properties/trilearn_intra-class")               |
| [trilearn_g_inv_wishart](#trilearn_g_inv_wishart)           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-trilearn_g_inv_wishart.md "myid#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart")           |
| [bdgraph_rgwish](#bdgraph_rgwish)                           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-bdgraph_rgwish.md "myid#/properties/resources/properties/parameters/properties/bdgraph_rgwish")                           |
| Additional Properties                                       | Any     | Optional | can be null    |                                                                                                                                                                                                                                                     |

## bin_bn

List of generateBinayBN objects

`bin_bn`

*   is optional

*   Type: `object[]` ([bin_bn](config-definitions-bin_bn.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-bin_bn.md "myid#/properties/resources/properties/parameters/properties/bin_bn")

### bin_bn Type

`object[]` ([bin_bn](config-definitions-bin_bn.md))

### bin_bn Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## notears_parameters_sampling

List of notears id's

`notears_parameters_sampling`

*   is optional

*   Type: unknown\[] ([Notears parameter sampling for Gaussian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaussian-bayesian-networks.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-notears_parameters_sampling.md "myid#/properties/resources/properties/parameters/properties/notears_parameters_sampling")

### notears_parameters_sampling Type

unknown\[] ([Notears parameter sampling for Gaussian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaussian-bayesian-networks.md))

### notears_parameters_sampling Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## sem_params

List of sem_params id's

`sem_params`

*   is optional

*   Type: `object[]` ([SEM params](config-definitions-sem-params.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-sem_params.md "myid#/properties/resources/properties/parameters/properties/sem_params")

### sem_params Type

`object[]` ([SEM params](config-definitions-sem-params.md))

### sem_params Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_hyper-dir

List of trilearn_hyper-dir id's

`trilearn_hyper-dir`

*   is optional

*   Type: `object[]` ([Hyper-Dirichlet](config-definitions-hyper-dirichlet.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-trilearn_hyper-dir.md "myid#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")

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

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-trilearn_intra-class.md "myid#/properties/resources/properties/parameters/properties/trilearn_intra-class")

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

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-trilearn_g_inv_wishart.md "myid#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart")

### trilearn_g_inv_wishart Type

`object[]` ([Graph graph inverse-Wishart model](config-definitions-graph-graph-inverse-wishart-model.md))

### trilearn_g_inv_wishart Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bdgraph_rgwish

List of graph inverse-Wishart id's

`bdgraph_rgwish`

*   is optional

*   Type: `object[]` ([Inverse of G-Wishart sample](config-definitions-inverse-of-g-wishart-sample.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-bdgraph_rgwish.md "myid#/properties/resources/properties/parameters/properties/bdgraph_rgwish")

### bdgraph_rgwish Type

`object[]` ([Inverse of G-Wishart sample](config-definitions-inverse-of-g-wishart-sample.md))

### bdgraph_rgwish Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## Additional Properties

Additional properties are allowed and do not have to follow a specific schema
