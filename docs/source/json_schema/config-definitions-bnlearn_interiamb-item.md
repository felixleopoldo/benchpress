# bnlearn_interiamb item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb
```

Inter-IAMB algorithm object

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bnlearn_interiamb Type

`object` ([bnlearn_interiamb item](config-definitions-bnlearn_interiamb-item.md))

# bnlearn_interiamb Properties

| Property                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                            |
| :-------------------------- | :-------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                   | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/id")                   |
| [plot_legend](#plot_legend) | `string`  | Optional | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-plot_legend.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/plot_legend") |
| [alpha](#alpha)             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/alpha")                                            |
| [test](#test)               | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/test")               |
| [B](#b)                     | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/B")                            |
| [maxsx](#maxsx)             | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/maxsx")                        |
| [debug](#debug)             | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-debug.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/debug")             |
| [undirected](#undirected)   | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-undirected.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/undirected")   |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting

`plot_legend`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-plot_legend.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/plot_legend")

### plot_legend Type

`string`

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## test



`test`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-test.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/test")

### test Type

`string`

### test Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value        | Explanation |
| :----------- | :---------- |
| `"mi"`       |             |
| `"mi-adf"`   |             |
| `"mc-mi"`    |             |
| `"smc-mi"`   |             |
| `"sp-mi"`    |             |
| `"mi-sh"`    |             |
| `"x2"`       |             |
| `"x2-adf"`   |             |
| `"sp-x2"`    |             |
| `"jt"`       |             |
| `"mc-jt"`    |             |
| `"smc-jt"`   |             |
| `"cor"`      |             |
| `"mc-cor"`   |             |
| `"smc-cor"`  |             |
| `"zf"`       |             |
| `"mc-zf"`    |             |
| `"smc-zf"`   |             |
| `"mi-g"`     |             |
| `"mc-mi-g"`  |             |
| `"smc-mi-g"` |             |
| `"mi-g-sh"`  |             |
| `"mi-cg"`    |             |

## B



`B`

*   is required

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/B")

### B Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [natnum type](config-definitions-natnum-type.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## maxsx



`maxsx`

*   is required

*   Type: merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/maxsx")

### maxsx Type

merged type ([Npn-negative integer or null](config-definitions-npn-negative-integer-or-null.md))

any of

*   any of

    *   [natnum type](config-definitions-natnum-type.md "check type definition")

    *   [Positive integer list](config-definitions-non-negative-integers-anyof-positive-integer-list.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-npn-negative-integer-or-null-anyof-1.md "check type definition")

## debug



`debug`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-debug.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/debug")

### debug Type

`boolean`

## undirected



`undirected`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bnlearn_interiamb-item-properties-undirected.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bnlearn_interiamb/properties/undirected")

### undirected Type

`boolean`
