# trilearn_intra-class item Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class
```

Parameter setting for a graph intra-class model

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## trilearn_intra-class Type

`object` ([trilearn_intra-class item](config-definitions-trilearn_intra-class-item.md))

# trilearn_intra-class Properties

| Property          | Type     | Required | Nullable       | Defined by                                                                                                                                                                                                                                |
| :---------------- | :------- | :------- | :------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [id](#id)         | `string` | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-trilearn_intra-class-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class/properties/id") |
| [rho](#rho)       | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class/properties/rho")                               |
| [sigma2](#sigma2) | Merged   | Required | cannot be null | [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class/properties/sigma2")                       |

## id



`id`

*   is required

*   Type: `string`

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-trilearn_intra-class-item-properties-id.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class/properties/id")

### id Type

`string`

## rho

Number(s) in the range \[0,1].

`rho`

*   is required

*   Type: merged type ([Details](config-definitions-flexprob.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexprob.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class/properties/rho")

### rho Type

merged type ([Details](config-definitions-flexprob.md))

any of

*   [prob type](config-definitions-flexprob-anyof-prob-type.md "check type definition")

*   [problist type](config-definitions-problist-type.md "check type definition")

## sigma2

Non-negative number(s).

`sigma2`

*   is required

*   Type: merged type ([Details](config-definitions-flexnonnegnum.md))

*   cannot be null

*   defined in: [JSON schema for Benchpress config file.](config-definitions-flexnonnegnum.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/definitions/trilearn_intra-class/properties/sigma2")

### sigma2 Type

merged type ([Details](config-definitions-flexnonnegnum.md))

any of

*   [nonnegnum type](config-definitions-flexnonnegnum-anyof-nonnegnum-type.md "check type definition")

*   [nonnegnumlist](config-definitions-nonnegnumlist.md "check type definition")
