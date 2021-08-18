# Seed range Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/data_setup_dict/properties/seed_range
```

This data setup will be simulated for this range of seeds. E.g. seed_range:\[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## seed_range Type

merged type ([Seed range](config-definitions-data-setup-properties-seed-range.md))

any of

*   [List of 2 integers \[a, b\], where a<=b.](config-definitions-data-setup-properties-seed-range-anyof-list-of-2-integers-a-b-where-ab.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-data-setup-properties-seed-range-anyof-1.md "check type definition")
