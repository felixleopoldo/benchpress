# mylib_myalg item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg
```

Parameter setting for mylib_myalg.

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## mylib_myalg Type

`object` ([mylib_myalg item](config-definitions-mylib_myalg-item.md))

## mylib_myalg Examples

```json
{
  "id": "mysetting",
  "mystringparam": "possiblevalue1",
  "myintparam": [
    2,
    3,
    5
  ],
  "timeout": null
}
```

# mylib_myalg Properties

| Property                        | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                    |
| :------------------------------ | :------- | :------- | :------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)                       | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mylib_myalg-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/id")                       |
| [myintparam](#myintparam)       | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/myintparam")                      |
| [mystringparam](#mystringparam) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-mylib_myalg-item-properties-mystringparam.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/mystringparam") |
| [timeout](#timeout)             | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/timeout")                    |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mylib_myalg-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/id")

### id Type

`string`

## myintparam

Non-negative integers, (0,1,2,...), or array of the same.

`myintparam`

*   is required

*   Type: merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-integers-1.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/myintparam")

### myintparam Type

merged type ([Non-negative integer(s)](config-definitions-non-negative-integers-1.md))

any of

*   [nonnegint type](config-definitions-nonnegint-type.md "check type definition")

*   [nonnegint list](config-definitions-nonnegint-list.md "check type definition")

## mystringparam



`mystringparam`

*   is required

*   Type: merged type ([Details](config-definitions-mylib_myalg-item-properties-mystringparam.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-mylib_myalg-item-properties-mystringparam.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/mystringparam")

### mystringparam Type

merged type ([Details](config-definitions-mylib_myalg-item-properties-mystringparam.md))

any of

*   [Untitled string in JSON schema for Benchpress config file.](config-definitions-mylib_myalg-item-properties-mystringparam-anyof-0.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-mylib_myalg-item-properties-mystringparam-anyof-1.md "check type definition")

## timeout

E.g. 1.5 or \[1.6, 3.8] or null.

`timeout`

*   is required

*   Type: merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/mylib_myalg/properties/timeout")

### timeout Type

merged type ([Non-negative number(s) or null](config-definitions-non-negative-numbers-or-null.md))

any of

*   any of

    *   [nonnegnum type](config-definitions-nonnegnum-type.md "check type definition")

    *   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")

*   [Untitled null in JSON schema for Benchpress config file.](config-definitions-non-negative-numbers-or-null-anyof-1.md "check type definition")
