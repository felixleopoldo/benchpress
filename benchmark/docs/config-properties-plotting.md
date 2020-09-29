# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/properties/plotting
```

Description of the plotting setup.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## plotting Type

`object` ([Details](config-properties-plotting.md))

# undefined Properties

| Property                  | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                |
| :------------------------ | ------- | -------- | -------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [algorithms](#algorithms) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-plotting-properties-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/plotting/properties/algorithms") |
| [models](#models)         | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-plotting-properties-models.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/plotting/properties/models")         |
| [fixed_data](#fixed_data) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-plotting-properties-fixed_data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/plotting/properties/fixed_data") |

## algorithms




`algorithms`

-   is optional
-   Type: `array`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-plotting-properties-algorithms.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/plotting/properties/algorithms")

### algorithms Type

`array`

### algorithms Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## models




`models`

-   is optional
-   Type: `object[]` ([Details](config-definitions-sampled_model_dict.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-plotting-properties-models.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/plotting/properties/models")

### models Type

`object[]` ([Details](config-definitions-sampled_model_dict.md))

## fixed_data




`fixed_data`

-   is optional
-   Type: `object[]` ([Details](config-definitions-fixed_data_dict.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-plotting-properties-fixed_data.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/properties/plotting/properties/fixed_data")

### fixed_data Type

`object[]` ([Details](config-definitions-fixed_data_dict.md))

### fixed_data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
