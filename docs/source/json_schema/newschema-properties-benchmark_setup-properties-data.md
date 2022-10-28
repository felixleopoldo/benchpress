# data Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/data
```

The data setup for the study.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                              |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [newschema.schema.json\*](newschema.schema.json "open original schema") |

## data Type

`object[]` ([data item](newschema-definitions-data-item.md))

## data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## data Examples

```json
[
  {
    "graph_id": "avneigs4_p20",
    "parameters_id": "SEM",
    "data_id": "standardized",
    "seed_range": [
      1,
      3
    ]
  }
]
```
