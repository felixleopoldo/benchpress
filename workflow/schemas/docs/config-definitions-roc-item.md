# ROC item Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item
```

ROC item


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## roc_item Type

`object` ([ROC item](config-definitions-roc-item.md))

# ROC item Properties

| Property                                                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                  |
| :------------------------------------------------------------ | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [structure_learning_algorithm](#structure_learning_algorithm) | `string` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-structure_learning_algorithm.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/structure_learning_algorithm") |
| [curve_variable](#curve_variable)                             | Merged   | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-curve-variable.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/curve_variable")                             |

## structure_learning_algorithm




`structure_learning_algorithm`

-   is optional
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-structure_learning_algorithm.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/structure_learning_algorithm")

### structure_learning_algorithm Type

`string`

## curve_variable

The varying parameter in the roc curve. This must be one of the parameters for the actual algorithm.


`curve_variable`

-   is optional
-   Type: merged type ([Curve variable](config-definitions-roc-item-properties-curve-variable.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-roc-item-properties-curve-variable.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/roc_item/properties/curve_variable")

### curve_variable Type

merged type ([Curve variable](config-definitions-roc-item-properties-curve-variable.md))

any of

-   [Curve variable](config-definitions-roc-item-properties-curve-variable-anyof-curve-variable.md "check type definition")
-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-roc-item-properties-curve-variable-anyof-1.md "check type definition")
