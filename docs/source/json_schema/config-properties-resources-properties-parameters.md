# parameters Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters
```

The available parameter sampling algorithms

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## parameters Type

`object` ([parameters](config-properties-resources-properties-parameters.md))

# parameters Properties

| Property                                                    | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                 |
| :---------------------------------------------------------- | :------ | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bin_bn](#bin_bn)                                           | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bin_bn.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bin_bn")                                           |
| [notears_parameters_sampling](#notears_parameters_sampling) | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-notears_parameters_sampling.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling") |
| [sem_params](#sem_params)                                   | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-sem_params.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/sem_params")                                   |
| [trilearn_hyper-dir](#trilearn_hyper-dir)                   | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_hyper-dir.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")                   |
| [trilearn_intra-class](#trilearn_intra-class)               | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_intra-class.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class")               |
| [trilearn_g_inv_wishart](#trilearn_g_inv_wishart)           | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_g_inv_wishart.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart")           |
| [bdgraph_rgwish](#bdgraph_rgwish)                           | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bdgraph_rgwish.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bdgraph_rgwish")                           |
| Additional Properties                                       | Any     | Optional | can be null    |                                                                                                                                                                                                                                                                                                            |

## bin_bn

List of generateBinayBN objects

`bin_bn`

*   is optional

*   Type: `object[]` ([bin_bn item](config-definitions-bin_bn-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bin_bn.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bin_bn")

### bin_bn Type

`object[]` ([bin_bn item](config-definitions-bin_bn-item.md))

### bin_bn Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## notears_parameters_sampling

List of notears id's

`notears_parameters_sampling`

*   is optional

*   Type: unknown\[] ([notears_parameters_sampling item](config-definitions-notears_parameters_sampling-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-notears_parameters_sampling.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling")

### notears_parameters_sampling Type

unknown\[] ([notears_parameters_sampling item](config-definitions-notears_parameters_sampling-item.md))

### notears_parameters_sampling Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## sem_params

List of sem_params id's

`sem_params`

*   is optional

*   Type: `object[]` ([sem_params item](config-definitions-sem_params-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-sem_params.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/sem_params")

### sem_params Type

`object[]` ([sem_params item](config-definitions-sem_params-item.md))

### sem_params Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_hyper-dir

List of trilearn_hyper-dir id's

`trilearn_hyper-dir`

*   is optional

*   Type: `object[]` ([trilearn_hyper-dir item](config-definitions-trilearn_hyper-dir-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_hyper-dir.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")

### trilearn_hyper-dir Type

`object[]` ([trilearn_hyper-dir item](config-definitions-trilearn_hyper-dir-item.md))

### trilearn_hyper-dir Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_intra-class

List of intra-class id's

`trilearn_intra-class`

*   is optional

*   Type: `object[]` ([trilearn_intra-class item](config-definitions-trilearn_intra-class-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_intra-class.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class")

### trilearn_intra-class Type

`object[]` ([trilearn_intra-class item](config-definitions-trilearn_intra-class-item.md))

### trilearn_intra-class Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn_g_inv_wishart

List of graph inverse-Wishart id's

`trilearn_g_inv_wishart`

*   is optional

*   Type: `object[]` ([trilearn_g_inv_wishart item](config-definitions-trilearn_g_inv_wishart-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_g_inv_wishart.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart")

### trilearn_g_inv_wishart Type

`object[]` ([trilearn_g_inv_wishart item](config-definitions-trilearn_g_inv_wishart-item.md))

### trilearn_g_inv_wishart Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bdgraph_rgwish

List of graph inverse-Wishart id's

`bdgraph_rgwish`

*   is optional

*   Type: `object[]` ([bdgraph_rgwish item](config-definitions-bdgraph_rgwish-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bdgraph_rgwish.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bdgraph_rgwish")

### bdgraph_rgwish Type

`object[]` ([bdgraph_rgwish item](config-definitions-bdgraph_rgwish-item.md))

### bdgraph_rgwish Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## Additional Properties

Additional properties are allowed and do not have to follow a specific schema
