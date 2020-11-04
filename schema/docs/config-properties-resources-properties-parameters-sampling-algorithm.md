# Parameters sampling algorithm Schema

```txt
http://github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters
```

The available parameter sampling algorithms


| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                                  |
| :------------------ | ---------- | -------------- | ------------ | :---------------- | --------------------- | ------------------- | --------------------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json\*](../../out/config.schema.json "open original schema") |

## parameters Type

`object` ([Parameters sampling algorithm](config-properties-resources-properties-parameters-sampling-algorithm.md))

# Parameters sampling algorithm Properties

| Property                                                    | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                       |
| :---------------------------------------------------------- | ------- | -------- | -------------- | :--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [generateBinaryBN](#generateBinaryBN)                       | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-generatebinarybn.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/generateBinaryBN")               |
| [bn.fit_networks](#bn.fit_networks)                         | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-bnfit_network-ids.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/bn.fit_networks")       |
| [notears_parameters_sampling](#notears_parameters_sampling) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-notears-ids.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling") |

## generateBinaryBN

List of generateBinayBN instatiations


`generateBinaryBN`

-   is optional
-   Type: `object[]` ([generateBinaryBN](config-definitions-generatebinarybn.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-generatebinarybn.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/generateBinaryBN")

### generateBinaryBN Type

`object[]` ([generateBinaryBN](config-definitions-generatebinarybn.md))

### generateBinaryBN Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## bn.fit_networks

List of bn.fit_network id's


`bn.fit_networks`

-   is optional
-   Type: unknown\[] ([Bn.fit network file](config-definitions-bnfit-network-file.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-bnfit_network-ids.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/bn.fit_networks")

### bn.fit_networks Type

unknown\[] ([Bn.fit network file](config-definitions-bnfit-network-file.md))

### bn.fit_networks Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## notears_parameters_sampling

List of notears id's


`notears_parameters_sampling`

-   is optional
-   Type: unknown\[] ([Notears parameter sampling for Gaissian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md))
-   cannot be null
-   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-parameters-sampling-algorithm-properties-list-of-notears-ids.md "http&#x3A;//github.com/felixleopoldo/benchpress/schema/config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling")

### notears_parameters_sampling Type

unknown\[] ([Notears parameter sampling for Gaissian Bayesian networks](config-definitions-notears-parameter-sampling-for-gaissian-bayesian-networks.md))

### notears_parameters_sampling Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.
