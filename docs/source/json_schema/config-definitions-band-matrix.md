# Band matrix Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat
```

A graph with a band structured adjacency matrix

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## bandmat Type

unknown ([Band matrix](config-definitions-band-matrix.md))

# Band matrix Properties

| Property                | Type     | Required | Nullable       | Defined by                                                                                                                                                                                              |
| :---------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)               | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-band-matrix-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat/properties/id")    |
| [dim](#dim)             | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat/properties/dim")       |
| [bandwidth](#bandwidth) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat/properties/bandwidth") |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-band-matrix-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-band-matrix-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat/properties/id")

### id Type

`string` ([ID](config-definitions-band-matrix-properties-id.md))

## dim

Non-negative integers, (0,1,2,...), or array of the same.

`dim`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat/properties/dim")

### dim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## bandwidth

Non-negative integers, (0,1,2,...), or array of the same.

`bandwidth`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bandmat/properties/bandwidth")

### bandwidth Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
