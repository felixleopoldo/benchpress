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
| [ids](#ids)                         | Not specified | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/ids")                         |
| [filename_prefix](#filename_prefix) | `string`      | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-filename_prefix.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/filename_prefix") |
| [point](#point)                     | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-point.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/point")                     |
| [show_seed](#show_seed)             | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-show_seed.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/show_seed")             |
| [scatter](#scatter)                 | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-scatter.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/scatter")                 |
| [errorbar](#errorbar)               | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-errorbar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/errorbar")               |
| [errorbarh](#errorbarh)             | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-errorbarh.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/errorbarh")             |
| [text](#text)                       | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-text.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/text")                       |
| [path](#path)                       | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-path.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/path")                       |

## ids



`ids`

*   is required

*   Type: unknown

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/ids")

### ids Type

unknown

## filename_prefix



`filename_prefix`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-filename_prefix.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/filename_prefix")

### filename_prefix Type

`string`

## point



`point`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-point.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/point")

### point Type

`boolean`

## show_seed



`show_seed`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-show_seed.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/show_seed")

### show_seed Type

`boolean`

## scatter



`scatter`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-scatter.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/scatter")

### scatter Type

`boolean`

## errorbar



`errorbar`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-errorbar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/errorbar")

### errorbar Type

`boolean`

## errorbarh



`errorbarh`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-errorbarh.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/errorbarh")

### errorbarh Type

`boolean`

## text



`text`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-text.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/text")

### text Type

`boolean`

## path



`path`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-roc-item-properties-path.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/roc/properties/path")

### path Type

`boolean`
