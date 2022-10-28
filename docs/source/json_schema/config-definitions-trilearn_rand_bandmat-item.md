# trilearn\_rand\_bandmat item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat
```

A graph with a band structured adjacency matrix with random width.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## trilearn\_rand\_bandmat Type

unknown ([trilearn\_rand\_bandmat item](config-definitions-trilearn_rand_bandmat-item.md))

## trilearn\_rand\_bandmat Examples

```json
{
  "id": "AR1-5",
  "max_bandwidth": 5,
  "dim": 50
}
```

# trilearn\_rand\_bandmat Properties

| Property                         | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                  |
| :------------------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)                        | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-trilearn_rand_bandmat-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat/properties/id") |
| [dim](#dim)                      | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat/properties/dim")                 |
| [max\_bandwidth](#max_bandwidth) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat/properties/max_bandwidth")       |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-trilearn_rand_bandmat-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-trilearn_rand_bandmat-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat/properties/id")

### id Type

`string` ([ID](config-definitions-trilearn_rand_bandmat-item-properties-id.md))

## dim

Non-negative integers, (0,1,2,...), or array of the same.

`dim`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat/properties/dim")

### dim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## max\_bandwidth

Non-negative integers, (0,1,2,...), or array of the same.

`max_bandwidth`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_rand_bandmat/properties/max_bandwidth")

### max\_bandwidth Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")
