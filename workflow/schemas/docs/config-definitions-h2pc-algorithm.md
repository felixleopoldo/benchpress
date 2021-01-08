# H2PC algorithm Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc
```

H2PC algorithm instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## h2pc Type

`object` ([H2PC algorithm](config-definitions-h2pc-algorithm.md))

# H2PC algorithm Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                           |
| :------------------------------ | -------- | -------- | -------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/id")                            |
| [plot_legend](#plot_legend)     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/plot_legend")          |
| [restrict.args](#restrict.args) | `object` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args") |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/plot_legend")

### plot_legend Type

`string`

## restrict.args




`restrict.args`

-   is required
-   Type: `object` ([Paramters for h2pc](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/h2pc/properties/restrict.args")

### restrict.args Type

`object` ([Paramters for h2pc](config-definitions-h2pc-algorithm-properties-paramters-for-h2pc.md))
