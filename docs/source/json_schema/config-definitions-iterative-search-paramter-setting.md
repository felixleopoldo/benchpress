# Iterative search (paramter setting) Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch
```

Iterative search +1 algorithm instance

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## bidag_itsearch Type

`object` ([Iterative search (paramter setting)](config-definitions-iterative-search-paramter-setting.md))

# Iterative search (paramter setting) Properties

| Property                | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                      |
| :---------------------- | :-------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)               | `string`  | Optional | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/id")               |
| [estimate](#estimate)   | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-estimate.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/estimate")   |
| [MAP](#map)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-map.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/MAP")             |
| [plus1it](#plus1it)     | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/plus1it")                            |
| [posterior](#posterior) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/posterior")                        |
| [softlimit](#softlimit) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/softlimit")                                  |
| [hardlimit](#hardlimit) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/hardlimit")                                  |
| [alpha](#alpha)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/alpha")                                    |
| [gamma](#gamma)         | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/gamma")                                              |
| [cpdag](#cpdag)         | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-cpdag.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/cpdag")         |
| [mergetype](#mergetype) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-mergetype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/mergetype") |
| [scoretype](#scoretype) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-scoretype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/scoretype") |
| [chi](#chi)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/chi")                                 |
| [edgepf](#edgepf)       | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/edgepf")                              |
| [am](#am)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/am")                                  |
| [aw](#aw)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/aw")                                  |

## id

Unique identifier

`id`

*   is optional

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/id")

### id Type

`string`

## estimate



`estimate`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-estimate.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/estimate")

### estimate Type

`string`

### estimate Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value        | Explanation |
| :----------- | :---------- |
| `"map"`      |             |
| `"endspace"` |             |

## MAP



`MAP`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-map.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/MAP")

### MAP Type

`boolean`

## plus1it



`plus1it`

*   is required

*   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/plus1it")

### plus1it Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

*   any of

    *   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

    *   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## posterior

Number(s) in the range \[0,1], or null.

`posterior`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\], or null.](config-definitions-numbers-in-the-range-01-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/posterior")

### posterior Type

merged type ([Number(s) in the range \[0,1\], or null.](config-definitions-numbers-in-the-range-01-or-null.md))

any of

*   any of

    *   [Probabaility](config-definitions-probabaility.md "check type definition")

    *   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01-or-null-anyof-1.md "check type definition")

## softlimit

Non-negative integers, (0,1,2,...), or array of the same.

`softlimit`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/softlimit")

### softlimit Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## hardlimit

Non-negative integers, (0,1,2,...), or array of the same.

`hardlimit`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/hardlimit")

### hardlimit Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")

## alpha



`alpha`

*   is required

*   Type: merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/alpha")

### alpha Type

merged type ([Number(s) in the range \[0,1\].](config-definitions-numbers-in-the-range-01.md))

any of

*   [Probabaility](config-definitions-probabaility.md "check type definition")

*   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")

## gamma

Non-negative number(s).

`gamma`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/gamma")

### gamma Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

*   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

## cpdag



`cpdag`

*   is required

*   Type: `boolean`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-cpdag.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/cpdag")

### cpdag Type

`boolean`

## mergetype



`mergetype`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-mergetype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/mergetype")

### mergetype Type

`string`

### mergetype Constraints

**enum**: the value of this property must be equal to one of the following values:

| Value        | Explanation |
| :----------- | :---------- |
| `"skeleton"` |             |

## scoretype



`scoretype`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-scoretype.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/scoretype")

### scoretype Type

`string`

## chi

E.g. 1.5 or \[1.6, 3.8] or null.

`chi`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/chi")

### chi Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## edgepf

E.g. 1.5 or \[1.6, 3.8] or null.

`edgepf`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/edgepf")

### edgepf Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## am

E.g. 1.5 or \[1.6, 3.8] or null.

`am`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/am")

### am Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## aw

E.g. 1.5 or \[1.6, 3.8] or null.

`aw`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/bidag_itsearch/properties/aw")

### aw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [Non-negative number](config-definitions-non-negative-number.md "check type definition")

    *   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")

*   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
