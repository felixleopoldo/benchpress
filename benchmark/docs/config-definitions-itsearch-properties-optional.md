# Untitled object in JSON schema for BenchPress config file. Schema

```txt
http://github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional
```

Algorithm parameters to show in plotting


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                               |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | ------------------------------------------------------------------------ |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../out/config.schema.json "open original schema") |

## optional Type

`object` ([Details](config-definitions-itsearch-properties-optional.md))

# undefined Properties

| Property                | Type      | Required | Nullable       | Defined by                                                                                                                                                                                                                                        |
| :---------------------- | --------- | -------- | -------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [MAP](#MAP)             | `boolean` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-optional-properties-map.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/MAP")             |
| [plus1it](#plus1it)     | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegintnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/plus1it")                                   |
| [posterior](#posterior) | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexprobnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/posterior")                                      |
| [scoretype](#scoretype) | `string`  | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-optional-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/scoretype") |
| [chi](#chi)             | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/chi")                                       |
| [edgepf](#edgepf)       | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/edgepf")                                    |
| [am](#am)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/am")                                        |
| [aw](#aw)               | Merged    | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/aw")                                        |

## MAP




`MAP`

-   is required
-   Type: `boolean`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-optional-properties-map.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/MAP")

### MAP Type

`boolean`

## plus1it




`plus1it`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegintnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegintnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/plus1it")

### plus1it Type

merged type ([Details](config-definitions-flexnonnegintnull.md))

any of

-   [Untitled integer in JSON schema for BenchPress config file.](config-definitions-nonnegint.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegintnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegintnull-anyof-2.md "check type definition")

## posterior




`posterior`

-   is required
-   Type: merged type ([Details](config-definitions-flexprobnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexprobnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/posterior")

### posterior Type

merged type ([Details](config-definitions-flexprobnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-prob.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexprobnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexprobnull-anyof-2.md "check type definition")

## scoretype




`scoretype`

-   is required
-   Type: `string`
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-itsearch-properties-optional-properties-scoretype.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/scoretype")

### scoretype Type

`string`

## chi




`chi`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/chi")

### chi Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## edgepf




`edgepf`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/edgepf")

### edgepf Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## am




`am`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/am")

### am Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")

## aw




`aw`

-   is required
-   Type: merged type ([Details](config-definitions-flexnonnegnumnull.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull.md "http&#x3A;//github.com/felixleopoldo/benchpress/config.schema#/definitions/itsearch/properties/optional/properties/aw")

### aw Type

merged type ([Details](config-definitions-flexnonnegnumnull.md))

any of

-   [Untitled number in JSON schema for BenchPress config file.](config-definitions-nonnegnum.md "check type definition")
-   [Untitled array in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-1.md "check type definition")
-   [Untitled null in JSON schema for BenchPress config file.](config-definitions-flexnonnegnumnull-anyof-2.md "check type definition")
