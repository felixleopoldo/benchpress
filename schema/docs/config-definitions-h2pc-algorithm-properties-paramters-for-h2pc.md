# Paramters for h2pc Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## restrict.args Type

`object` ([Paramters for h2pc](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md))

# Paramters for h2pc Properties

| Property        | Type   | Required | Nullable       | Defined by                                                                                                                                                                                                                       |
| :-------------- | ------ | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [alpha](#alpha) | Merged | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args/properties/alpha") |

## alpha




`alpha`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")
