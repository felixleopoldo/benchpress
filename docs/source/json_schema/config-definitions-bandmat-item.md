# bandmat item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat
```

A graph with a band structured adjacency matrix

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## bandmat Type

unknown ([bandmat item](config-definitions-bandmat-item.md))

## bandmat Examples

```json
{
  "id": "AR2",
  "bandwidth": 2,
  "dim": 50
}
```

# bandmat Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                          |
| :---------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)               | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bandmat-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat/properties/id")     |
| [dim](#dim)             | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat/properties/dim")       |
| [bandwidth](#bandwidth) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat/properties/bandwidth") |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-bandmat-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bandmat-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat/properties/id")

### id Type

`string` ([ID](config-definitions-bandmat-item-properties-id.md))

## dim

Non-negative integers, (0,1,2,...), or array of the same.

`dim`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat/properties/dim")

### dim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## bandwidth

Non-negative integers, (0,1,2,...), or array of the same.

`bandwidth`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bandmat/properties/bandwidth")

### bandwidth Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")
