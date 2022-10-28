# graph\_plots Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots
```

This module plots and saves the estimated graphs in dot-format. The figures are saved in results/adjmat and copied to results/output/graph\_plots/.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [config.schema.json\*](config.schema.json "open original schema") |

## graph\_plots Type

`string[]`

## graph\_plots Examples

```json
[
  "fges-sem-bic",
  "mmhc-bge-zf",
  "omcmc_itsample-bge",
  "pc-gaussCItest"
]
```
