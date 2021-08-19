# adjmat_plots Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots
```

This module plots the adjacency matrices of the estimated graphs. The figures are saved in results/adjmat and copied to results/output/adjmat_plots/.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## adjmat_plots Type

`string[]`

## adjmat_plots Examples

```json
[
  "fges-sem-bic",
  "mmhc-bge-zf",
  "omcmc_itsample-bge",
  "pc-gaussCItest"
]
```
