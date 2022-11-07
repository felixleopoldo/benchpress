# iid Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid
```

Data sampling from disctete Bayesian network.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## iid Type

`object` ([iid](config-definitions-iid.md))

## iid Examples

```json
{
  "id": "standardized",
  "standardized": true,
  "sample_sizes": [
    100
  ]
}
```

# iid Properties

| Property                       | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                             |
| :----------------------------- | :-------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                      | `string`  | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-iid-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid/properties/id")              |
| [sample\_sizes](#sample_sizes) | Merged    | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid/properties/sample_sizes")     |
| [standardized](#standardized)  | `boolean` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-iid-properties-standardized.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid/properties/standardized") |

## id



`id`

*   is required

*   Type: `string` ([Unique ID](config-definitions-iid-properties-unique-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-iid-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid/properties/id")

### id Type

`string` ([Unique ID](config-definitions-iid-properties-unique-id.md))

## sample\_sizes

Non-negative integers, (0,1,2,...), or array of the same.

`sample_sizes`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid/properties/sample_sizes")

### sample\_sizes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## standardized



`standardized`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-iid-properties-standardized.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/iid/properties/standardized")

### standardized Type

`boolean`
