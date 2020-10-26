# Data sampling algorithms Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms
```

Data sampling setup.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## data_sampling_algorithms Type

`object` ([Data sampling algorithms](config-properties-data-sampling-algorithms.md))

# Data sampling algorithms Properties

| Property                                                              | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                             |
| :-------------------------------------------------------------------- | ------- | -------- | -------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [standard_sampling](#standard_sampling)                               | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms-properties-list-of-standard_sampling-setups.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms/properties/standard_sampling")                                     |
| [notears_linear_gaussian_sampling](#notears_linear_gaussian_sampling) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms-properties-list-of-settings-for-notears_linear_gaussian_sampling.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms/properties/notears_linear_gaussian_sampling") |
| [fixed_data](#fixed_data)                                             | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms-properties-list-of-fixed_data-ids.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms/properties/fixed_data")                                                      |

## standard_sampling

List of standard_sampling setups.


`standard_sampling`

-   is optional
-   Type: `object[]` ([Standard sampling](config-definitions-standard-sampling.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms-properties-list-of-standard_sampling-setups.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms/properties/standard_sampling")

### standard_sampling Type

`object[]` ([Standard sampling](config-definitions-standard-sampling.md))

### standard_sampling Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## notears_linear_gaussian_sampling

List of settings for notears_linear_gaussian_sampling


`notears_linear_gaussian_sampling`

-   is optional
-   Type: unknown\[] ([Notears linear Gaussian sampling](config-definitions-notears-linear-gaussian-sampling.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms-properties-list-of-settings-for-notears_linear_gaussian_sampling.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms/properties/notears_linear_gaussian_sampling")

### notears_linear_gaussian_sampling Type

unknown\[] ([Notears linear Gaussian sampling](config-definitions-notears-linear-gaussian-sampling.md))

### notears_linear_gaussian_sampling Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## fixed_data

List of fixed_data id's


`fixed_data`

-   is optional
-   Type: unknown\[] ([Data file](config-definitions-data-file.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-data-sampling-algorithms-properties-list-of-fixed_data-ids.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/data_sampling_algorithms/properties/fixed_data")

### fixed_data Type

unknown\[] ([Data file](config-definitions-data-file.md))

### fixed_data Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
