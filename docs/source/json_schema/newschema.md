# JSON schema for Benchpress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json
```



| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                            |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :-------------------------------------------------------------------- |
| Can be instantiated | Yes        | Unknown status | No           | Forbidden         | Allowed               | none                | [newschema.schema.json](newschema.schema.json "open original schema") |

## JSON schema for Benchpress config file. Type

`object` ([JSON schema for Benchpress config file.](newschema.md))

# JSON schema for Benchpress config file. Properties

| Property                             | Type          | Required | Nullable       | Defined by                                                                                                                                                                                      |
| :----------------------------------- | :------------ | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [benchmark\_setup](#benchmark_setup) | `object`      | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-properties-benchmark_setup.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup") |
| [resources](#resources)              | Not specified | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-properties-resources.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources")             |

## benchmark\_setup

Defines the actual benchmarking setup, where the resources are references by their corresponding id.

`benchmark_setup`

*   is optional

*   Type: `object` ([benchmark\_setup](newschema-properties-benchmark_setup.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-properties-benchmark_setup.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup")

### benchmark\_setup Type

`object` ([benchmark\_setup](newschema-properties-benchmark_setup.md))

## resources

The available modules for generating graphs, parameters, data and structure learning algorithms.

`resources`

*   is optional

*   Type: unknown ([resources](newschema-properties-resources.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-properties-resources.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources")

### resources Type

unknown ([resources](newschema-properties-resources.md))

# JSON schema for Benchpress config file. Definitions

## Definitions group notears\_parameters\_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling"}
```

| Property                                                       | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                      |
| :------------------------------------------------------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                                      | `string` | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-notears_parameters_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/id")                                      |
| [edge\_coefficient\_range\_from](#edge_coefficient_range_from) | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from") |
| [edge\_coefficient\_range\_to](#edge_coefficient_range_to)     | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to") |

### id



`id`

*   is optional

*   Type: `string` ([ID](newschema-definitions-notears_parameters_sampling-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-notears_parameters_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/id")

#### id Type

`string` ([ID](newschema-definitions-notears_parameters_sampling-item-properties-id.md))

### edge\_coefficient\_range\_from

Non-negative number

`edge_coefficient_range_from`

*   is optional

*   Type: `number` ([nonnegnum type](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from")

#### edge\_coefficient\_range\_from Type

`number` ([nonnegnum type](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type.md))

#### edge\_coefficient\_range\_from Constraints

**minimum**: the value of this number must greater than or equal to: `0`

### edge\_coefficient\_range\_to

Non-negative number

`edge_coefficient_range_to`

*   is optional

*   Type: `number` ([nonnegnum type](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to")

#### edge\_coefficient\_range\_to Type

`number` ([nonnegnum type](newschema-definitions-notears_parameters_sampling-item-properties-nonnegnum-type-1.md))

#### edge\_coefficient\_range\_to Constraints

**minimum**: the value of this number must greater than or equal to: `0`

## Definitions group notears\_dag\_sampling

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling"}
```

| Property                 | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                               |
| :----------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id-1)              | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-notears_dag_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/id")             |
| [num\_nodes](#num_nodes) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")                      |
| [num\_edges](#num_edges) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")                      |
| [mean](#mean)            | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-notears_dag_sampling-item-properties-mean.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/mean")         |
| [variance](#variance)    | `number` | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-notears_dag_sampling-item-properties-variance.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/variance") |

### id



`id`

*   is required

*   Type: `string` ([ID](newschema-definitions-notears_dag_sampling-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-notears_dag_sampling-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/id")

#### id Type

`string` ([ID](newschema-definitions-notears_dag_sampling-item-properties-id.md))

### num\_nodes

Non-negative integers, (0,1,2,...), or array of the same.

`num_nodes`

*   is required

*   Type: merged type ([Non-negative integer(s)](newschema-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes")

#### num\_nodes Type

merged type ([Non-negative integer(s)](newschema-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](newschema-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](newschema-definitions-nonnegint-list.md "check type definition")

### num\_edges

Non-negative integers, (0,1,2,...), or array of the same.

`num_edges`

*   is required

*   Type: merged type ([Non-negative integer(s)](newschema-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/num_edges")

#### num\_edges Type

merged type ([Non-negative integer(s)](newschema-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](newschema-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](newschema-definitions-nonnegint-list.md "check type definition")

### mean



`mean`

*   is optional

*   Type: `number` ([Mean](newschema-definitions-notears_dag_sampling-item-properties-mean.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-notears_dag_sampling-item-properties-mean.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/mean")

#### mean Type

`number` ([Mean](newschema-definitions-notears_dag_sampling-item-properties-mean.md))

### variance



`variance`

*   is optional

*   Type: `number` ([Variance](newschema-definitions-notears_dag_sampling-item-properties-variance.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-notears_dag_sampling-item-properties-variance.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/notears_dag_sampling/properties/variance")

#### variance Type

`number` ([Variance](newschema-definitions-notears_dag_sampling-item-properties-variance.md))

## Definitions group data\_setup\_dict

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict"}
```

| Property                         | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                    |
| :------------------------------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [graph\_id](#graph_id)           | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/graph_id")           |
| [parameters\_id](#parameters_id) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/parameters_id") |
| [data\_id](#data_id)             | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-data_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/data_id")             |
| [seed\_range](#seed_range)       | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-seed_range.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range")       |

### graph\_id

ID of the graph object.

`graph_id`

*   is required

*   Type: merged type ([graph\_id](newschema-definitions-data-item-properties-graph_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/graph_id")

#### graph\_id Type

merged type ([graph\_id](newschema-definitions-data-item-properties-graph_id.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id-anyof-1.md "check type definition")

### parameters\_id

ID of a module object in the parameters section.

`parameters_id`

*   is required

*   Type: merged type ([parameters\_id](newschema-definitions-data-item-properties-parameters_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/parameters_id")

#### parameters\_id Type

merged type ([parameters\_id](newschema-definitions-data-item-properties-parameters_id.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id-anyof-1.md "check type definition")

### data\_id

Data sampling method ID.

`data_id`

*   is required

*   Type: `string` ([data\_id](newschema-definitions-data-item-properties-data_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-data_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/data_id")

#### data\_id Type

`string` ([data\_id](newschema-definitions-data-item-properties-data_id.md))

### seed\_range

This data setup will be simulated for this range of seeds. E.g. seed\_range:\[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.

`seed_range`

*   is required

*   Type: merged type ([seed\_range](newschema-definitions-data-item-properties-seed_range.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-seed_range.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range")

#### seed\_range Type

merged type ([seed\_range](newschema-definitions-data-item-properties-seed_range.md))

any of

*   [range](newschema-definitions-data-item-properties-seed_range-anyof-range.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-seed_range-anyof-1.md "check type definition")

## Definitions group prob

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/prob"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group problist

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/problist"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group natnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/natnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group nonnegint

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/nonnegint"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group nonnegnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/nonnegnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group nonnegnumlist

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/nonnegnumlist"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnonnegnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnonnegnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnonnegnumnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnonnegnumnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnonnegint

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnonnegint"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group nonnegintlist

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/nonnegintlist"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnonnegintnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnonnegintnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnonnegintstring

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnonnegintstring"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnatnum

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnatnum"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexnatnumnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexnatnumnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexprob

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexprob"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |

## Definitions group flexprobnull

Reference this group by using

```json
{"$ref":"http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/flexprobnull"}
```

| Property | Type | Required | Nullable | Defined by |
| :------- | :--- | :------- | :------- | :--------- |
