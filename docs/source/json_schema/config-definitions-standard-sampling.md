# Standard sampling Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid
```

Data sampling from disctete Bayesian network.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## iid Type

`object` ([Standard sampling](config-definitions-standard-sampling.md))

# iid Properties

| Property                      | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                 |
| :---------------------------- | :-------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                     | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard-sampling-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid/properties/id")              |
| [sample_sizes](#sample_sizes) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid/properties/sample_sizes")                     |
| [standardized](#standardized) | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-standard-sampling-properties-standardized.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid/properties/standardized") |

## id



`id`

*   is required

*   Type: `string` ([Unique ID](config-definitions-standard-sampling-properties-unique-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-standard-sampling-properties-unique-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid/properties/id")

### id Type

`string` ([Unique ID](config-definitions-standard-sampling-properties-unique-id.md))

## sample_sizes

Non-negative integers, (0,1,2,...), or array of the same.

`sample_sizes`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid/properties/sample_sizes")

### sample_sizes Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## standardized



`standardized`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-standard-sampling-properties-standardized.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/iid/properties/standardized")

### standardized Type

`boolean`
