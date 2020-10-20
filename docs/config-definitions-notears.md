# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/notears
```

Notears instance


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## notears Type

`object` ([Details](config-definitions-notears.md))

# undefined Properties

| Property                                      | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                  |
| :-------------------------------------------- | -------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                     | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/id")                   |
| [plot_legend](#plot_legend)                   | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/plot_legend") |
| [min_rate_of_progress](#min_rate_of_progress) | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/min_rate_of_progress")              |
| [penalty_growth_rate](#penalty_growth_rate)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/penalty_growth_rate")          |
| [optimation_accuracy](#optimation_accuracy)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/optimation_accuracy")          |
| [loss](#loss)                                 | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss")               |
| [loss_grad](#loss_grad)                       | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss_grad")     |

## id

Unique idenfifier


`id`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-id.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/id")

### id Type

`string`

## plot_legend

Legend to show in plotting


`plot_legend`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-plot_legend.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/plot_legend")

### plot_legend Type

`string`

## min_rate_of_progress




`min_rate_of_progress`

-   is required
-   Type: merged type ([Details](config-definitions-flexprob.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprob.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/min_rate_of_progress")

### min_rate_of_progress Type

merged type ([Details](config-definitions-flexprob.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprob-anyof-1.md "check type definition")

## penalty_growth_rate




`penalty_growth_rate`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/penalty_growth_rate")

### penalty_growth_rate Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

## optimation_accuracy




`optimation_accuracy`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnum.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/optimation_accuracy")

### optimation_accuracy Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnum-anyof-1.md "check type definition")

## loss




`loss`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss")

### loss Type

`string`

### loss Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value                      | Explanation |
| :------------------------- | ----------- |
| `"least_squares_loss"`     |             |
| `"least_squares_loss_cov"` |             |

## loss_grad




`loss_grad`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-notears-properties-loss_grad.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/notears/properties/loss_grad")

### loss_grad Type

`string`

### loss_grad Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value                           | Explanation |
| :------------------------------ | ----------- |
| `"least_squares_loss_grad"`     |             |
| `"least_squares_loss_cov_grad"` |             |
