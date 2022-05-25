# trilearn_cta item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta
```

Graph sampling method provided by the trilearn package.
Documentation: <https://github.com/felixleopoldo/trilearn>

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## trilearn_cta Type

unknown ([trilearn_cta item](config-definitions-trilearn_cta-item.md))

## trilearn_cta Examples

```json
{
  "id": "trilearn_cta",
  "order": 50,
  "alpha": 0.5,
  "beta": 0.7
}
```

# trilearn_cta item Properties

| Property        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                |
| :-------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)       | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-trilearn_cta-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/id") |
| [order](#order) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/order")      |
| [alpha](#alpha) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/alpha")                     |
| [beta](#beta)   | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/beta")                      |

## id



`id`

*   is required

*   Type: `string` ([ID](config-definitions-trilearn_cta-item-properties-id.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-trilearn_cta-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/id")

### id Type

`string` ([ID](config-definitions-trilearn_cta-item-properties-id.md))

## order

Non-negative integers, (0,1,2,...), or array of the same.

`order`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/order")

### order Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-non-negative-integers-1-anyof-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## alpha

Number(s) in the range \[0,1].

`alpha`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/alpha")

### alpha Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-flexprob-anyof-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## beta

Number(s) in the range \[0,1].

`beta`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_cta/properties/beta")

### beta Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-flexprob-anyof-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")
