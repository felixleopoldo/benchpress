# Notears linear Gaussian sampling Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling
```

Notears linear Gaussian sampling. This requires that the parameters are of type notears_parameters.


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## notears_linear_gaussian_sampling Type

unknown ([Notears linear Gaussian sampling](config-definitions-notears-linear-gaussian-sampling.md))

# Notears linear Gaussian sampling Properties

| Property                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                          |
| :---------------------------- | -------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                     | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/id")             |
| [sample_sizes](#sample_sizes) | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/sample_sizes")                            |
| [mean](#mean)                 | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-mean.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/mean")         |
| [variance](#variance)         | `number` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-variance.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/variance") |

## id




`id`

-   is optional
-   Type: `string` ([ID](config-definitions-notears-linear-gaussian-sampling-properties-id.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/id")

### id Type

`string` ([ID](config-definitions-notears-linear-gaussian-sampling-properties-id.md))

## sample_sizes

Non-negative integers, (0,1,2,...), or array of the same.


`sample_sizes`

-   is optional
-   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/sample_sizes")

### sample_sizes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

-   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")
-   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## mean




`mean`

-   is optional
-   Type: `number` ([Mean](config-definitions-notears-linear-gaussian-sampling-properties-mean.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-mean.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/mean")

### mean Type

`number` ([Mean](config-definitions-notears-linear-gaussian-sampling-properties-mean.md))

## variance




`variance`

-   is optional
-   Type: `number` ([Variance](config-definitions-notears-linear-gaussian-sampling-properties-variance.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-linear-gaussian-sampling-properties-variance.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears_linear_gaussian_sampling/properties/variance")

### variance Type

`number` ([Variance](config-definitions-notears-linear-gaussian-sampling-properties-variance.md))
