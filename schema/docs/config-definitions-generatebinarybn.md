# generateBinaryBN Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN
```

Parameter setting for generateBinaryBN


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## generateBinaryBN Type

`object` ([generateBinaryBN](config-definitions-generatebinarybn.md))

# generateBinaryBN Properties

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                              |
| :---------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/id") |
| [min](#min) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/min")       |
| [max](#max) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/max")       |

## id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/id")

### id Type

`string`

## min




`min`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/min")

### min Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## max




`max`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/generateBinaryBN/properties/max")

### max Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

-   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")
-   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")
