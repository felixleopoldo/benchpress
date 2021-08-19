# rand_bandmat item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat
```

A graph with a band structured adjacency matrix with random width.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## rand_bandmat Type

unknown ([rand_bandmat item](config-definitions-rand_bandmat-item.md))

## rand_bandmat Examples

```json
{
  "id": "AR1-5",
  "max_bandwidth": 5,
  "dim": 50
}
```

# rand_bandmat Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                   |
| :------------------------------ | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-rand_bandmat-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat/properties/id")    |
| [dim](#dim)                     | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat/properties/dim")           |
| [max_bandwidth](#max_bandwidth) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth") |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-rand_bandmat-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-rand_bandmat-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat/properties/id")

### id Type

`string` ([ID](config-definitions-rand_bandmat-item-properties-id.md))

## dim

Non-negative integers, (0,1,2,...), or array of the same.

`dim`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat/properties/dim")

### dim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")

## max_bandwidth

Non-negative integers, (0,1,2,...), or array of the same.

`max_bandwidth`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth")

### max_bandwidth Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [Untitled undefined type in JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1-anyof-1.md "check type definition")
