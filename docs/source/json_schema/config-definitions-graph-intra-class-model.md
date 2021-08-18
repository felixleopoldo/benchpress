# Graph intra-class model Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class
```

Parameter setting for a graph intra-class model

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## trilearn_intra-class Type

`object` ([Graph intra-class model](config-definitions-graph-intra-class-model.md))

# trilearn_intra-class Properties

| Property          | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                    |
| :---------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)         | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-graph-intra-class-model-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class/properties/id") |
| [rho](#rho)       | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class/properties/rho")              |
| [sigma2](#sigma2) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class/properties/sigma2")                     |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-graph-intra-class-model-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class/properties/id")

### id Type

`string`

## rho



`rho`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class/properties/rho")

### rho Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-numbers-in-the-range-01-anyof-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## sigma2

Non-negative number(s).

`sigma2`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/trilearn_intra-class/properties/sigma2")

### sigma2 Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-flexnonnegnum-anyof-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
