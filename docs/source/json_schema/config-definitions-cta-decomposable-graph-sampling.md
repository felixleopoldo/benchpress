# CTA decomposable graph sampling Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta
```

Graph sampling method provided by the trilearn package.
Documentation: <https://github.com/felixleopoldo/trilearn>

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## trilearn_cta Type

unknown ([CTA decomposable graph sampling](config-definitions-cta-decomposable-graph-sampling.md))

# trilearn_cta Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                    |
| :-------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-cta-decomposable-graph-sampling-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/id") |
| [order](#order) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/order")                      |
| [alpha](#alpha) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/alpha")                    |
| [beta](#beta)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/beta")                     |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-cta-decomposable-graph-sampling-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-cta-decomposable-graph-sampling-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/id")

### id Type

`string` ([ID](config-definitions-cta-decomposable-graph-sampling-properties-id.md))

## order

Non-negative integers, (0,1,2,...), or array of the same.

`order`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/order")

### order Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integers-anyof-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## alpha



`alpha`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## beta



`beta`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_cta/properties/beta")

### beta Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")
