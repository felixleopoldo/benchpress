# Evaluation methods Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation
```




| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## evaluation Type

unknown ([Evaluation methods](config-properties-benchmark-setup-properties-evaluation-methods.md))

# Evaluation methods Properties

| Property    | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                |
| :---------- | ------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [ROC](#ROC) | `array` | Required | cannot be null | [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-roc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/ROC") |

## ROC

Algorithm id's for ROC evaluation.


`ROC`

-   is required
-   Type: `object[]` ([ROC item](config-definitions-roc-item.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-benchmark-setup-properties-evaluation-methods-properties-roc.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/ROC")

### ROC Type

`object[]` ([ROC item](config-definitions-roc-item.md))

### ROC Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
