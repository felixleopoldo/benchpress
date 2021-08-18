# data Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/data
```

The data setup for the study.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## data Type

`object[]` ([data item](config-definitions-data-item.md))

## data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
