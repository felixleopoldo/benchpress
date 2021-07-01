# Guidici & Green algorithm for sampling from decomposable graph distributions Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair_fortran
```

Guidici & Green algorithm for learning decomopasble graphs.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                    |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](../../../out/config.schema.json "open original schema") |

## gg99\_singlepair_fortran Type

`object` ([Guidici & Green algorithm for sampling from decomposable graph distributions](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-1.md))

# gg99\_singlepair_fortran Properties

| Property  | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                             |
| :-------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id) | `string` | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-1-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair_fortran/properties/id") |
| [n](#n)   | Merged   | Required | cannot be null | [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99_singlepair_fortran/properties/n")                                                                        |

## id

Unique identifier

`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions-1-properties-id.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair_fortran/properties/id")

### id Type

`string`

## n

Non-negative integers, (0,1,2,...), or array of the same.

`n`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-definitions-non-negative-integers.md "http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/definitions/gg99\_singlepair_fortran/properties/n")

### n Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers.md))

any of

*   [Non-negative integer](config-definitions-non-negative-integer.md "check type definition")

*   [Non-negative integer list](config-definitions-non-negative-integers-anyof-non-negative-integer-list.md "check type definition")
