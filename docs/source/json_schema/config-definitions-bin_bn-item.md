# bin\_bn item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn
```

Parameter setting for generateBinaryBN

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](config.schema.json "open original schema") |

## bin\_bn Type

`object` ([bin\_bn item](config-definitions-bin_bn-item.md))

## bin\_bn Examples

```json
{
  "id": "binbn",
  "min": 0.1,
  "max": 0.9
}
```

# bin\_bn Properties

| Property    | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                    |
| :---------- | :------- | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [id](#id)   | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-bin_bn-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn/properties/id") |
| [min](#min) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn/properties/min")                 |
| [max](#max) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn/properties/max")                 |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-bin_bn-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn/properties/id")

### id Type

`string`

## min

Number(s) in the range \[0,1].

`min`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn/properties/min")

### min Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-flexprob-anyof-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## max

Number(s) in the range \[0,1].

`max`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/bin_bn/properties/max")

### max Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-flexprob-anyof-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")
