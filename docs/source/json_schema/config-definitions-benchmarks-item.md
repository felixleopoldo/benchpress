# benchmarks item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks
```

ROC item

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## benchmarks Type

`object` ([benchmarks item](config-definitions-benchmarks-item.md))

## benchmarks Examples

```json
{
  "filename_prefix": "example/",
  "point": true,
  "show_seed": true,
  "errorbar": true,
  "errorbarh": false,
  "xrange": [
    0,
    1
  ],
  "yrange": [
    0,
    1
  ],
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

# benchmarks Properties

| Property                            | Type          | Required | Nullable       | Defined by                                                                                                                                                                                                                                      |
| :---------------------------------- | :------------ | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ids](#ids)                         | Not specified | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/ids")                         |
| [filename_prefix](#filename_prefix) | `string`      | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-filename_prefix.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/filename_prefix") |
| [xlim](#xlim)                       | Merged        | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-xlim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/xlim")                       |
| [ylim](#ylim)                       | Merged        | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-ylim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/ylim")                       |
| [show_seed](#show_seed)             | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-show_seed.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/show_seed")             |
| [scatter](#scatter)                 | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-scatter.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/scatter")                 |
| [errorbar](#errorbar)               | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-errorbar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/errorbar")               |
| [errorbarh](#errorbarh)             | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-errorbarh.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/errorbarh")             |
| [text](#text)                       | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-text.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/text")                       |
| [path](#path)                       | `boolean`     | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-path.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/path")                       |

## ids



`ids`

*   is required

*   Type: unknown

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/ids")

### ids Type

unknown

## filename_prefix



`filename_prefix`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-filename_prefix.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/filename_prefix")

### filename_prefix Type

`string`

## xlim

x-axis limits in ROC plots.

`xlim`

*   is optional

*   Type: merged type ([xlim](config-definitions-benchmarks-item-properties-xlim.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-xlim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/xlim")

### xlim Type

merged type ([xlim](config-definitions-benchmarks-item-properties-xlim.md))

any of

*   [range](config-definitions-benchmarks-item-properties-xlim-anyof-range.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-xlim-anyof-1.md "check type definition")

## ylim

y-axis limits in ROC plots.

`ylim`

*   is optional

*   Type: merged type ([ylim](config-definitions-benchmarks-item-properties-ylim.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-ylim.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/ylim")

### ylim Type

merged type ([ylim](config-definitions-benchmarks-item-properties-ylim.md))

any of

*   [range](config-definitions-benchmarks-item-properties-ylim-anyof-range.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-ylim-anyof-1.md "check type definition")

## show_seed



`show_seed`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-show_seed.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/show_seed")

### show_seed Type

`boolean`

## scatter



`scatter`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-scatter.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/scatter")

### scatter Type

`boolean`

## errorbar



`errorbar`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-errorbar.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/errorbar")

### errorbar Type

`boolean`

## errorbarh



`errorbarh`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-errorbarh.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/errorbarh")

### errorbarh Type

`boolean`

## text



`text`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-text.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/text")

### text Type

`boolean`

## path



`path`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-benchmarks-item-properties-path.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/benchmarks/properties/path")

### path Type

`boolean`
