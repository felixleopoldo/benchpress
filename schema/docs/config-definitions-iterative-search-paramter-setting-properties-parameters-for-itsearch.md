# Parameters for itsearch Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional
```

Algorithm parameters to show in plotting


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## optional Type

`object` ([Parameters for itsearch](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch.md))

# Parameters for itsearch Properties

| Property                | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                            |
| :---------------------- | --------- | -------- | -------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [MAP](#MAP)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch-properties-map.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/MAP")             |
| [plus1it](#plus1it)     | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/plus1it")                                                               |
| [posterior](#posterior) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/posterior")                                                           |
| [scoretype](#scoretype) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/scoretype") |
| [chi](#chi)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/chi")                                                                    |
| [edgepf](#edgepf)       | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/edgepf")                                                                 |
| [am](#am)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/am")                                                                     |
| [aw](#aw)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/aw")                                                                     |

## MAP




`MAP`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch-properties-map.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/MAP")

### MAP Type

`boolean`

## plus1it




`plus1it`

-   is required
-   Type: merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/plus1it")

### plus1it Type

merged type ([Non-negative integer(s), or null.](config-definitions-non-negative-integers-or-null.md))

any of

-   any of

    -   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")
    -   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-integers-or-null-anyof-1.md "check type definition")

## posterior

Number(s) in the range [0,1], or null.


`posterior`

-   is required
-   Type: merged type ([Number(s) in the range \[0,1\], or null.](config-definitions-numbers-in-the-range-01-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/posterior")

### posterior Type

merged type ([Number(s) in the range \[0,1\], or null.](config-definitions-numbers-in-the-range-01-or-null.md))

any of

-   any of

    -   [Probabaility](config-definitions-probabaility.md "check type definition")
    -   [Probability list](config-definitions-numbers-in-the-range-01-anyof-probability-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-numbers-in-the-range-01-or-null-anyof-1.md "check type definition")

## scoretype




`scoretype`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-iterative-search-paramter-setting-properties-parameters-for-itsearch-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/scoretype")

### scoretype Type

`string`

## chi

E.g. 1.5 or [1.6, 3.8] or null.


`chi`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/chi")

### chi Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## edgepf

E.g. 1.5 or [1.6, 3.8] or null.


`edgepf`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/edgepf")

### edgepf Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## am

E.g. 1.5 or [1.6, 3.8] or null.


`am`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/am")

### am Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")

## aw

E.g. 1.5 or [1.6, 3.8] or null.


`aw`

-   is required
-   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/itsearch/properties/optional/properties/aw")

### aw Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

-   any of

    -   [Non-negative number](config-definitions-non-negative-number.md "check type definition")
    -   [Non-negative number list](config-definitions-flexnonnegnum-anyof-non-negative-number-list.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
