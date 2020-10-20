# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/properties/data
```

Data sampling setup.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## data Type

`object` ([Details](config-properties-data.md))

# undefined Properties

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                            |
| :---------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [replicates](#replicates)     | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-data-properties-replicates.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/data/properties/replicates")     |
| [sample_sizes](#sample_sizes) | `array`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-data-properties-sample_sizes.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/data/properties/sample_sizes") |

## replicates

Interval of seeds to simulate from.


`replicates`

-   is required
-   Type: `object` ([Details](config-properties-data-properties-replicates.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data-properties-replicates.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/data/properties/replicates")

### replicates Type

`object` ([Details](config-properties-data-properties-replicates.md))

## sample_sizes

Sample sizes in simulation setup arranged in a list of list of sample sizes.


`sample_sizes`

-   is required
-   Type: `integer[][]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data-properties-sample_sizes.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/data/properties/sample_sizes")

### sample_sizes Type

`integer[][]`
