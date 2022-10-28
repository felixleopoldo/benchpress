# parameters Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters
```

The available parameter sampling algorithms

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](config.schema.json "open original schema") |

## parameters Type

`object` ([parameters](config-properties-resources-properties-parameters.md))

# parameters Properties

| Property                                             | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                       |
| :--------------------------------------------------- | :------ | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [bin\_bn](#bin_bn)                                   | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bin_bn.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bin_bn")                                 |
| [sem\_params](#sem_params)                           | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-sem_params.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/sem_params")                         |
| [trilearn\_hyper-dir](#trilearn_hyper-dir)           | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_hyper-dir.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")         |
| [trilearn\_intra-class](#trilearn_intra-class)       | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_intra-class.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class")     |
| [trilearn\_g\_inv\_wishart](#trilearn_g_inv_wishart) | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_g_inv_wishart.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart") |
| [bdgraph\_rgwish](#bdgraph_rgwish)                   | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bdgraph_rgwish.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bdgraph_rgwish")                 |
| Additional Properties                                | Any     | Optional | can be null    |                                                                                                                                                                                                                                                                                                  |

## bin\_bn

List of generateBinayBN objects

`bin_bn`

*   is optional

*   Type: `object[]` ([bin\_bn item](config-definitions-bin_bn-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bin_bn.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bin_bn")

### bin\_bn Type

`object[]` ([bin\_bn item](config-definitions-bin_bn-item.md))

### bin\_bn Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## sem\_params

List of sem\_params id's

`sem_params`

*   is optional

*   Type: `object[]` ([sem\_params item](config-definitions-sem_params-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-sem_params.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/sem_params")

### sem\_params Type

`object[]` ([sem\_params item](config-definitions-sem_params-item.md))

### sem\_params Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn\_hyper-dir

List of trilearn\_hyper-dir id's

`trilearn_hyper-dir`

*   is optional

*   Type: `object[]` ([trilearn\_hyper-dir item](config-definitions-trilearn_hyper-dir-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_hyper-dir.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir")

### trilearn\_hyper-dir Type

`object[]` ([trilearn\_hyper-dir item](config-definitions-trilearn_hyper-dir-item.md))

### trilearn\_hyper-dir Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn\_intra-class

List of intra-class id's

`trilearn_intra-class`

*   is optional

*   Type: `object[]` ([trilearn\_intra-class item](config-definitions-trilearn_intra-class-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_intra-class.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class")

### trilearn\_intra-class Type

`object[]` ([trilearn\_intra-class item](config-definitions-trilearn_intra-class-item.md))

### trilearn\_intra-class Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## trilearn\_g\_inv\_wishart

List of graph inverse-Wishart id's

`trilearn_g_inv_wishart`

*   is optional

*   Type: `object[]` ([trilearn\_g\_inv\_wishart item](config-definitions-trilearn_g_inv_wishart-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-trilearn_g_inv_wishart.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart")

### trilearn\_g\_inv\_wishart Type

`object[]` ([trilearn\_g\_inv\_wishart item](config-definitions-trilearn_g_inv_wishart-item.md))

### trilearn\_g\_inv\_wishart Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bdgraph\_rgwish

List of graph inverse-Wishart id's

`bdgraph_rgwish`

*   is optional

*   Type: `object[]` ([bdgraph\_rgwish item](config-definitions-bdgraph_rgwish-item.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-parameters-properties-bdgraph_rgwish.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/parameters/properties/bdgraph_rgwish")

### bdgraph\_rgwish Type

`object[]` ([bdgraph\_rgwish item](config-definitions-bdgraph_rgwish-item.md))

### bdgraph\_rgwish Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## Additional Properties

Additional properties are allowed and do not have to follow a specific schema
