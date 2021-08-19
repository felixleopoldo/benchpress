# roc item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc
```

ROC item

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## roc Type

`object` ([roc item](config-definitions-roc-item.md))

## roc Examples

```json
{
  "filename_prefix": "example/",
  "point": true,
  "errorbar": true,
  "path": true,
  "text": false,
  "ids": [
    "fges-sem-bic",
    "mmhc-bge-zf",
    "omcmc_itsample-bge",
    "pc-gaussCItest"
  ]
}
```

# roc Properties

| Property                            | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                        |
| :---------------------------------- | :------------ | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ids](#ids)                         | Not specified | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/ids")                         |
| [filename_prefix](#filename_prefix) | `string`      | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-filename_prefix.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/filename_prefix") |
| [point](#point)                     | `boolean`     | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-point.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/point")                     |
| [text](#text)                       | `boolean`     | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-text.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/text")                       |
| [path](#path)                       | `boolean`     | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-path.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/path")                       |
| [errorbar](#errorbar)               | `boolean`     | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-errorbar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/errorbar")               |

## ids



`ids`

*   is optional

*   Type: unknown

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/ids")

### ids Type

unknown

## filename_prefix



`filename_prefix`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-filename_prefix.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/filename_prefix")

### filename_prefix Type

`string`

## point



`point`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-point.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/point")

### point Type

`boolean`

## text



`text`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-text.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/text")

### text Type

`boolean`

## path



`path`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-path.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/path")

### path Type

`boolean`

## errorbar



`errorbar`

*   is optional

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-errorbar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/errorbar")

### errorbar Type

`boolean`
