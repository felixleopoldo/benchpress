# data Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data
```

Data sampling setup.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                              |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [newschema.schema.json\*](newschema.schema.json "open original schema") |

## data Type

`object` ([data](newschema-properties-resources-properties-data.md))

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

| Property                                         | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                            |
| :----------------------------------------------- | :------------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [iid](#iid)                                      | Not specified | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-properties-resources-properties-data-properties-iid.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/iid")                                     |
| [gcastle\_iidsimulation](#gcastle_iidsimulation) | Not specified | Optional | cannot be null | [JSON schema for Benchpress config file.](newschema-properties-resources-properties-data-properties-gcastle_iidsimulation.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/gcastle_iidsimulation") |

## iid



`iid`

*   is optional

*   Type: unknown

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-properties-resources-properties-data-properties-iid.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/iid")

### iid Type

unknown

## gcastle\_iidsimulation



`gcastle_iidsimulation`

*   is optional

*   Type: unknown

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](newschema-properties-resources-properties-data-properties-gcastle_iidsimulation.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/data/properties/gcastle_iidsimulation")

### gcastle\_iidsimulation Type

unknown
