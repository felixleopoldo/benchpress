# data item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict
```

Description of the data model and sampling setup. Make sure that the id's are properly combined.
If a CSV file is specified as data\_id then parameters\_id and seed\_range should be null whereas graph\_id should be the true graphs that generated the dataset.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                              |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [newschema.schema.json\*](newschema.schema.json "open original schema") |

## data\_setup\_dict Type

`object` ([data item](newschema-definitions-data-item.md))

## data\_setup\_dict Examples

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

# data\_setup\_dict Properties

| Property                         | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                    |
| :------------------------------- | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [graph\_id](#graph_id)           | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/graph_id")           |
| [parameters\_id](#parameters_id) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/parameters_id") |
| [data\_id](#data_id)             | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-data_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/data_id")             |
| [seed\_range](#seed_range)       | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-seed_range.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range")       |

## graph\_id

ID of the graph object.

`graph_id`

*   is required

*   Type: merged type ([graph\_id](newschema-definitions-data-item-properties-graph_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/graph_id")

### graph\_id Type

merged type ([graph\_id](newschema-definitions-data-item-properties-graph_id.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-graph_id-anyof-1.md "check type definition")

## parameters\_id

ID of a module object in the parameters section.

`parameters_id`

*   is required

*   Type: merged type ([parameters\_id](newschema-definitions-data-item-properties-parameters_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/parameters_id")

### parameters\_id Type

merged type ([parameters\_id](newschema-definitions-data-item-properties-parameters_id.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-parameters_id-anyof-1.md "check type definition")

## data\_id

Data sampling method ID.

`data_id`

*   is required

*   Type: `string` ([data\_id](newschema-definitions-data-item-properties-data_id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-data_id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/data_id")

### data\_id Type

`string` ([data\_id](newschema-definitions-data-item-properties-data_id.md))

## seed\_range

This data setup will be simulated for this range of seeds. E.g. seed\_range:\[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.

`seed_range`

*   is required

*   Type: merged type ([seed\_range](newschema-definitions-data-item-properties-seed_range.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-seed_range.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range")

### seed\_range Type

merged type ([seed\_range](newschema-definitions-data-item-properties-seed_range.md))

any of

*   [range](newschema-definitions-data-item-properties-seed_range-anyof-range.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](newschema-definitions-data-item-properties-seed_range-anyof-1.md "check type definition")
