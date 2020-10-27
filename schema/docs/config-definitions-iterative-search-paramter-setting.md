# Iterative search (paramter setting) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch
```

Iterative search +1 algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## itsearch Type

`object` ([Iterative search (paramter setting)](config-definitions-iterative-search-paramter-setting.md))

# Iterative search (paramter setting) Properties

| Property                    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :-------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/id")                            |
| [plot_legend](#plot_legend) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/plot_legend")          |
| [optional](#optional)       | `object` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional") |

## id

Unique idenfifier


`id`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/plot_legend")

### plot_legend Type

`string`

## optional

Algorithm parameters to show in plotting


`optional`

-   is optional
-   Type: `object` ([Parameters for itsearch](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional")

### optional Type

`object` ([Parameters for itsearch](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md))
