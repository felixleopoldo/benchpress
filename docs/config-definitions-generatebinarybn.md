# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN
```

Parameter setting for generateBinaryBN


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## generateBinaryBN Type

`object` ([Details](config-definitions-generatebinarybn.md))

# undefined Properties

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                    |
| :---------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/id")   |
| [min](#min) | `number` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-min.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/min") |
| [max](#max) | `number` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-max.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/max") |

## id




`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/id")

### id Type

`string`

## min

Minimum probability


`min`

-   is required
-   Type: `number`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-min.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/min")

### min Type

`number`

### min Constraints

**maximum**: the value of this number must smaller than or equal to: `1`

**minimum**: the value of this number must greater than or equal to: `0`

## max

Maximum probability


`max`

-   is required
-   Type: `number`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-generatebinarybn-properties-max.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/generateBinaryBN/properties/max")

### max Type

`number`

### max Constraints

**maximum**: the value of this number must smaller than or equal to: `1`

**minimum**: the value of this number must greater than or equal to: `0`
