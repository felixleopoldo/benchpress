# Notears Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears
```

Notears instantiation

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## notears Type

`object` ([Notears](config-definitions-notears.md))

# notears Properties

| Property                                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                           |
| :-------------------------------------------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/id")                     |
| [min_rate_of_progress](#min_rate_of_progress) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/min_rate_of_progress") |
| [penalty_growth_rate](#penalty_growth_rate)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/penalty_growth_rate")            |
| [optimation_accuracy](#optimation_accuracy)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/optimation_accuracy")            |
| [loss](#loss)                                 | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss")                 |
| [loss_grad](#loss_grad)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss_grad")       |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/id")

### id Type

`string`

## min_rate_of_progress



`min_rate_of_progress`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/min_rate_of_progress")

### min_rate_of_progress Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## penalty_growth_rate

Non-negative number(s).

`penalty_growth_rate`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/penalty_growth_rate")

### penalty_growth_rate Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## optimation_accuracy

Non-negative number(s).

`optimation_accuracy`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/optimation_accuracy")

### optimation_accuracy Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## loss



`loss`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss")

### loss Type

`string`

### loss Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value                      | Explanation |
| :------------------------- | :---------- |
| `"least_squares_loss"`     |             |
| `"least_squares_loss_cov"` |             |

## loss_grad



`loss_grad`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/notears/properties/loss_grad")

### loss_grad Type

`string`

### loss_grad Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value                           | Explanation |
| :------------------------------ | :---------- |
| `"least_squares_loss_grad"`     |             |
| `"least_squares_loss_cov_grad"` |             |
