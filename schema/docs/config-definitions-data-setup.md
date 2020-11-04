# Data setup Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict
```

Description of the data model and sampling setup. Make sure that the id's are properly combined.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## data_setup_dict Type

`object` ([Data setup](config-definitions-data-setup.md))

# Data setup Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                          |
| :------------------------------ | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [graph_id](#graph_id)           | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/graph_id")           |
| [parameters_id](#parameters_id) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/parameters_id") |
| [data_id](#data_id)             | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/data_id")             |
| [seed_range](#seed_range)       | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/seed_range")    |

## graph_id

ID of the graph instantiation.


`graph_id`

-   is required
-   Type: `string` ([Graph](config-definitions-data-setup-properties-graph.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-graph.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/graph_id")

### graph_id Type

`string` ([Graph](config-definitions-data-setup-properties-graph.md))

## parameters_id

Parameters ID.


`parameters_id`

-   is required
-   Type: merged type ([Parameters](config-definitions-data-setup-properties-parameters.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/parameters_id")

### parameters_id Type

merged type ([Parameters](config-definitions-data-setup-properties-parameters.md))

any of

-   [Untitled string in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters-anyof-0.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-parameters-anyof-1.md "check type definition")

## data_id

Data sampling method ID.


`data_id`

-   is required
-   Type: `string` ([Data](config-definitions-data-setup-properties-data.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-data.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/data_id")

### data_id Type

`string` ([Data](config-definitions-data-setup-properties-data.md))

## seed_range

This data setup will be simulated for this range of seeds. E.g. seed_range:[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.


`seed_range`

-   is required
-   Type: merged type ([Seed range](config-definitions-data-setup-properties-seed-range.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/data_setup_dict/properties/seed_range")

### seed_range Type

merged type ([Seed range](config-definitions-data-setup-properties-seed-range.md))

any of

-   [List of 2 integers \[a, b\], where a&lt;=b.](config-definitions-data-setup-properties-seed-range-anyof-list-of-2-integers-a-b-where-ab.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range-anyof-1.md "check type definition")
