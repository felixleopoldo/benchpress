# data item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict
```

Description of the data model and sampling setup. Make sure that the id's are properly combined.
If a CSV file is specified as data_id then parameters_id and seed_range should be null whereas graph_id should be the true graphs that generated the dataset.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## data_setup_dict Type

`object` ([data item](config-definitions-data-item.md))

## data_setup_dict Examples

```json
{
  "graph_id": "avneigs4_p20",
  "parameters_id": "SEM",
  "data_id": "standardized",
  "seed_range": [
    1,
    3
  ]
}
```

# data item Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                 |
| :------------------------------ | :------- | :------- | :------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [graph_id](#graph_id)           | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-data-item-properties-graph_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/graph_id")           |
| [parameters_id](#parameters_id) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-data-item-properties-parameters_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/parameters_id") |
| [data_id](#data_id)             | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-data-item-properties-data_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/data_id")             |
| [seed_range](#seed_range)       | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-data-item-properties-seed_range.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range")       |

## graph_id

ID of the graph object.

`graph_id`

*   is required

*   Type: merged type ([graph_id](config-definitions-data-item-properties-graph_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-data-item-properties-graph_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/graph_id")

### graph_id Type

merged type ([graph_id](config-definitions-data-item-properties-graph_id.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-data-item-properties-graph_id-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-data-item-properties-graph_id-anyof-1.md "check type definition")

## parameters_id

ID of a module object in the parameters section.

`parameters_id`

*   is required

*   Type: merged type ([parameters_id](config-definitions-data-item-properties-parameters_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-data-item-properties-parameters_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/parameters_id")

### parameters_id Type

merged type ([parameters_id](config-definitions-data-item-properties-parameters_id.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-data-item-properties-parameters_id-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-data-item-properties-parameters_id-anyof-1.md "check type definition")

## data_id

Data sampling method ID.

`data_id`

*   is required

*   Type: `string` ([data_id](config-definitions-data-item-properties-data_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-data-item-properties-data_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/data_id")

### data_id Type

`string` ([data_id](config-definitions-data-item-properties-data_id.md))

## seed_range

This data setup will be simulated for this range of seeds. E.g. seed_range:\[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.

`seed_range`

*   is required

*   Type: merged type ([seed_range](config-definitions-data-item-properties-seed_range.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-data-item-properties-seed_range.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range")

### seed_range Type

merged type ([seed_range](config-definitions-data-item-properties-seed_range.md))

any of

*   [range](config-definitions-data-item-properties-seed_range-anyof-range.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-data-item-properties-seed_range-anyof-1.md "check type definition")
