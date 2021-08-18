# Available structure learning algorithms Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms
```

The available structure learning algorithms

| Abstract            | Extensible | Status         | Identifiable | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :----------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | No           | Forbidden         | Forbidden             | none                | [config.schema.json*](config.schema.json "open original schema") |

## structure_learning_algorithms Type

`object` ([Available structure learning algorithms](config-properties-resources-properties-available-structure-learning-algorithms.md))

# structure_learning_algorithms Properties

| Property                                | Type    | Required | Nullable       | Defined by                                                                                                                                                                                                                                                                                                                                   |
| :-------------------------------------- | :------ | :------- | :------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [trilearn_pgibbs](#trilearn_pgibbs)     | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-list-of-trilearn-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/trilearn_pgibbs")  |
| [rblip](#rblip)                         | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-list-of-blip-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/rblip")                |
| [notears](#notears)                     | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-notears-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/notears")                   |
| [gobnilp](#gobnilp)                     | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-gobnilp-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gobnilp")                   |
| [tetrad_fges](#tetrad_fges)             | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-fges-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fges")                  |
| [tetrad_fci](#tetrad_fci)               | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-fci-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fci")                    |
| [tetrad_rfci](#tetrad_rfci)             | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-rfci.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_rfci")                          |
| [tetrad_gfci](#tetrad_gfci)             | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-gfci.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_gfci")                          |
| [pcalg_pc](#pcalg_pc)                   | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-pc-algorithm-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/pcalg_pc")             |
| [bnlearn_mmhc](#bnlearn_mmhc)           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-mmhc-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_mmhc")                 |
| [bnlearn_tabu](#bnlearn_tabu)           | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-tabu-search-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_tabu")          |
| [bidag_itsearch](#bidag_itsearch)       | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-iterative-1-search-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_itsearch") |
| [bidag_order_mcmc](#bidag_order_mcmc)   | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-order-mcmc-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_order_mcmc")       |
| [bnlearn_interiamb](#bnlearn_interiamb) | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-inter-iamb-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_interiamb")      |
| [bnlearn_gs](#bnlearn_gs)               | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-gs-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_gs")                     |
| [bnlearn_hc](#bnlearn_hc)               | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-hc-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_hc")                     |
| [gt13_multipair](#gt13_multipair)       | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-green--thomas-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gt13_multipair")          |
| [gg99_singlepair](#gg99_singlepair)     | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-guidici--green-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gg99_singlepair")        |
| [sklearn_glasso](#sklearn_glasso)       | `array` | Optional | cannot be null | [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-glasso.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/sklearn_glasso")                     |

## trilearn_pgibbs

List of trilearn objects

`trilearn_pgibbs`

*   is optional

*   Type: `object[]` ([Trilearn](config-definitions-trilearn.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-list-of-trilearn-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/trilearn_pgibbs")

### trilearn_pgibbs Type

`object[]` ([Trilearn](config-definitions-trilearn.md))

### trilearn_pgibbs Constraints

**unique items**: all items in this array must be unique. Duplicates are not allowed.

## rblip

List of blip objects

`rblip`

*   is optional

*   Type: `object[]` ([Blip object](config-definitions-blip-object.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-list-of-blip-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/rblip")

### rblip Type

`object[]` ([Blip object](config-definitions-blip-object.md))

## notears

Notears objects

`notears`

*   is optional

*   Type: `object[]` ([Notears](config-definitions-notears.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-notears-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/notears")

### notears Type

`object[]` ([Notears](config-definitions-notears.md))

## gobnilp

Gobnilp objects

`gobnilp`

*   is optional

*   Type: `object[]` ([Gobnilp algorithm](config-definitions-gobnilp-algorithm.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-gobnilp-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gobnilp")

### gobnilp Type

`object[]` ([Gobnilp algorithm](config-definitions-gobnilp-algorithm.md))

## tetrad_fges

fGES objects

`tetrad_fges`

*   is optional

*   Type: `object[]` ([Fast greedy equivalent search (fGES)](config-definitions-fast-greedy-equivalent-search-fges.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-fges-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fges")

### tetrad_fges Type

`object[]` ([Fast greedy equivalent search (fGES)](config-definitions-fast-greedy-equivalent-search-fges.md))

## tetrad_fci

FCI objects

`tetrad_fci`

*   is optional

*   Type: `object[]` ([FCI](config-definitions-fci.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-fci-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fci")

### tetrad_fci Type

`object[]` ([FCI](config-definitions-fci.md))

## tetrad_rfci

RFCI Really fast causal inference

`tetrad_rfci`

*   is optional

*   Type: `object[]` ([RFCI](config-definitions-rfci.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-rfci.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_rfci")

### tetrad_rfci Type

`object[]` ([RFCI](config-definitions-rfci.md))

## tetrad_gfci

GFCI

`tetrad_gfci`

*   is optional

*   Type: `object[]` ([GFCI (parameter setting)](config-definitions-gfci-parameter-setting.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-gfci.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_gfci")

### tetrad_gfci Type

`object[]` ([GFCI (parameter setting)](config-definitions-gfci-parameter-setting.md))

## pcalg_pc

PC algorithm objects

`pcalg_pc`

*   is optional

*   Type: `object[]` ([PC algorithm](config-definitions-pc-algorithm.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-pc-algorithm-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/pcalg_pc")

### pcalg_pc Type

`object[]` ([PC algorithm](config-definitions-pc-algorithm.md))

## bnlearn_mmhc

MMHC objects

`bnlearn_mmhc`

*   is optional

*   Type: `object[]` ([Max-min hill climbing algorithm (MMHC)](config-definitions-max-min-hill-climbing-algorithm-mmhc.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-mmhc-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_mmhc")

### bnlearn_mmhc Type

`object[]` ([Max-min hill climbing algorithm (MMHC)](config-definitions-max-min-hill-climbing-algorithm-mmhc.md))

## bnlearn_tabu

Tabu search objects

`bnlearn_tabu`

*   is optional

*   Type: `object[]` ([TABU search (parameter setting)](config-definitions-tabu-search-parameter-setting.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-tabu-search-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_tabu")

### bnlearn_tabu Type

`object[]` ([TABU search (parameter setting)](config-definitions-tabu-search-parameter-setting.md))

## bidag_itsearch

Iterative +1 search objects

`bidag_itsearch`

*   is optional

*   Type: `object[]` ([Iterative search (paramter setting)](config-definitions-iterative-search-paramter-setting.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-iterative-1-search-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_itsearch")

### bidag_itsearch Type

`object[]` ([Iterative search (paramter setting)](config-definitions-iterative-search-paramter-setting.md))

## bidag_order_mcmc

Order MCMC objects

`bidag_order_mcmc`

*   is optional

*   Type: `object[]` ([Order MCMC (parameter setting)](config-definitions-order-mcmc-parameter-setting.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-order-mcmc-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_order_mcmc")

### bidag_order_mcmc Type

`object[]` ([Order MCMC (parameter setting)](config-definitions-order-mcmc-parameter-setting.md))

## bnlearn_interiamb

Inter-IAMB objects

`bnlearn_interiamb`

*   is optional

*   Type: `object[]` ([Inter-IAMB algorithm](config-definitions-inter-iamb-algorithm.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-inter-iamb-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_interiamb")

### bnlearn_interiamb Type

`object[]` ([Inter-IAMB algorithm](config-definitions-inter-iamb-algorithm.md))

## bnlearn_gs

GS objects

`bnlearn_gs`

*   is optional

*   Type: `object[]` ([Inter-IAMB algorithm](config-definitions-inter-iamb-algorithm.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-gs-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_gs")

### bnlearn_gs Type

`object[]` ([Inter-IAMB algorithm](config-definitions-inter-iamb-algorithm.md))

## bnlearn_hc

HC objects

`bnlearn_hc`

*   is optional

*   Type: `object[]` ([HC algorithm (parameter setting)](config-definitions-hc-algorithm-parameter-setting.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-hc-objects.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_hc")

### bnlearn_hc Type

`object[]` ([HC algorithm (parameter setting)](config-definitions-hc-algorithm-parameter-setting.md))

## gt13\_multipair

Green & Thomas objects

`gt13_multipair`

*   is optional

*   Type: `object[]` ([Green & Thomas algorithm for sampling from decomposable graph distributions](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-green--thomas-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gt13\_multipair")

### gt13\_multipair Type

`object[]` ([Green & Thomas algorithm for sampling from decomposable graph distributions](config-definitions-green--thomas-algorithm-for-sampling-from-decomposable-graph-distributions.md))

## gg99\_singlepair

Guidici & Green parametrisarion

`gg99_singlepair`

*   is optional

*   Type: `object[]` ([Guidici & Green algorithm for sampling from decomposable graph distributions](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-guidici--green-ids.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gg99\_singlepair")

### gg99\_singlepair Type

`object[]` ([Guidici & Green algorithm for sampling from decomposable graph distributions](config-definitions-guidici--green-algorithm-for-sampling-from-decomposable-graph-distributions.md))

## sklearn_glasso

GLasso scikit-learn implementation

`sklearn_glasso`

*   is optional

*   Type: `object[]` ([GLasso algorithm](config-definitions-glasso-algorithm.md))

*   cannot be null

*   defined in: [JSON schema for BenchPress config file.](config-properties-resources-properties-available-structure-learning-algorithms-properties-glasso.md "http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/sklearn_glasso")

### sklearn_glasso Type

`object[]` ([GLasso algorithm](config-definitions-glasso-algorithm.md))
