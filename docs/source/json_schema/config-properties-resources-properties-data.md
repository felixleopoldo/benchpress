# data Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data
```

Data sampling setup.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## data Type

`object` ([data](config-properties-resources-properties-data.md))

## data Examples

```json
{
  "id": "standardized",
  "standardized": true,
  "sample_sizes": [
    100
  ]
}
```

```json
{
  "id": "nonstandardized",
  "standardized": false,
  "sample_sizes": [
    1000
  ]
}
```

# data Properties

| Property                                         | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                        |
| :----------------------------------------------- | :------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [iid](#iid)                                      | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-data-properties-list-of-iid-setups.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/iid")                                     |
| [gcastle\_iidsimulation](#gcastle_iidsimulation) | `array` | Optional | cannot be null | [JSON schema for Benchpress config file.](config-properties-resources-properties-data-properties-list-of-gcastle_iidsimulation-setups.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/gcastle_iidsimulation") |

## iid

List of iid setups.

`iid`

*   is optional

*   Type: `object[]` ([iid](config-definitions-iid.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-data-properties-list-of-iid-setups.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/iid")

### iid Type

`object[]` ([iid](config-definitions-iid.md))

### iid Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## gcastle\_iidsimulation

List of gcastle\_iidsimulation setups.

`gcastle_iidsimulation`

*   is optional

*   Type: `object[]` ([gcastle\_iidsimulation](config-definitions-gcastle_iidsimulation.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-properties-resources-properties-data-properties-list-of-gcastle_iidsimulation-setups.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/gcastle_iidsimulation")

### gcastle\_iidsimulation Type

`object[]` ([gcastle\_iidsimulation](config-definitions-gcastle_iidsimulation.md))

### gcastle\_iidsimulation Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
