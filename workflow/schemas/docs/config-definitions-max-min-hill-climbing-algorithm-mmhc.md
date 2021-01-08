# Max-min hill climbing algorithm (MMHC) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc
```

MMHC algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## mmhc Type

`object` ([Max-min hill climbing algorithm (MMHC)](config-definitions-max-min-hill-climbing-algorithm-mmhc.md))

# Max-min hill climbing algorithm (MMHC) Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :------------------------------ | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/id")                             |
| [plot_legend](#plot_legend)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/plot_legend")           |
| [restrict.args](#restrict.args) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/restrict.args") |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/plot_legend")

### plot_legend Type

`string`

## restrict.args




`restrict.args`

-   is required
-   Type: `object` ([Parameters for mmhc](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/mmhc/properties/restrict.args")

### restrict.args Type

`object` ([Parameters for mmhc](config-definitions-max-min-hill-climbing-algorithm-mmhc-properties-parameters-for-mmhc.md))
