# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling
```

Sampling data from the multivariate distribution.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## standard_sampling Type

`object` ([Details](config-definitions-standard_sampling.md))

# undefined Properties

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :---------------------------- | -------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/id")                     |
| [sample_sizes](#sample_sizes) | `array`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-sample_sizes.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/sample_sizes") |

## id




`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/id")

### id Type

`string`

## sample_sizes

Sample sizes in simulation setup arranged in a list of list of sample sizes.


`sample_sizes`

-   is required
-   Type: `integer[]`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-standard_sampling-properties-sample_sizes.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/standard_sampling/properties/sample_sizes")

### sample_sizes Type

`integer[]`
