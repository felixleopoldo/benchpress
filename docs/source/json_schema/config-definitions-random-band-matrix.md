# Random band matrix Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat
```

A graph with a band structured adjacency matrix with random width

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## rand_bandmat Type

unknown ([Random band matrix](config-definitions-random-band-matrix.md))

# rand_bandmat Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                       |
| :------------------------------ | :------- | :------- | :------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-random-band-matrix-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat/properties/id") |
| [dim](#dim)                     | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat/properties/dim")           |
| [max_bandwidth](#max_bandwidth) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth") |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-random-band-matrix-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-random-band-matrix-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat/properties/id")

### id Type

`string` ([ID](config-definitions-random-band-matrix-properties-id.md))

## dim

Non-negative integers, (0,1,2,...), or array of the same.

`dim`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat/properties/dim")

### dim Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## max_bandwidth

Non-negative integers, (0,1,2,...), or array of the same.

`max_bandwidth`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth")

### max_bandwidth Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
