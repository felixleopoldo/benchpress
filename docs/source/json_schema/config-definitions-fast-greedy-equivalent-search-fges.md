# Fast greedy equivalent search (fGES) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges
```

fGES instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## tetrad_fges Type

`object` ([Fast greedy equivalent search (fGES)](config-definitions-fast-greedy-equivalent-search-fges.md))

# tetrad_fges Properties

| Property                                    | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                        |
| :------------------------------------------ | :-------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                                   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/id")                                   |
| [faithfulnessAssumed](#faithfulnessassumed) | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-faithfulnessassumed.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/faithfulnessAssumed") |
| [score](#score)                             | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-score.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/score")                             |
| [datatype](#datatype)                       | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-datatype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/datatype")                       |
| [samplePrior](#sampleprior)                 | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/samplePrior")                                                             |
| [penaltyDiscount](#penaltydiscount)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/penaltyDiscount")                                          |
| [structurePrior](#structureprior)           | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/structurePrior")                                                          |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/id")

### id Type

`string`

## faithfulnessAssumed



`faithfulnessAssumed`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-faithfulnessassumed.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/faithfulnessAssumed")

### faithfulnessAssumed Type

`boolean`

## score



`score`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-score.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/score")

### score Type

`string`

## datatype



`datatype`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-fast-greedy-equivalent-search-fges-properties-datatype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/datatype")

### datatype Type

`string`

## samplePrior

Non-negative number(s).

`samplePrior`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/samplePrior")

### samplePrior Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## penaltyDiscount

E.g. 1.5 or \[1.6, 3.8] or null.

`penaltyDiscount`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/penaltyDiscount")

### penaltyDiscount Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## structurePrior

Non-negative number(s).

`structurePrior`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/tetrad_fges/properties/structurePrior")

### structurePrior Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
