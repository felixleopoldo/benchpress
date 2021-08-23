# mcmc_autocorr_plots Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots
```

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                       |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :--------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [config.schema.json*](config.schema.json "open original schema") |

## mcmc_autocorr_plots Type

unknown\[] ([mcmc_autocorr_plots item](config-definitions-mcmc_autocorr_plots-item.md))

## mcmc_autocorr_plots Examples

```json
[
  {
    "id": "omcmc_itsample-bge",
    "burn_in": 0,
    "thinning": 1,
    "lags": 50,
    "functional": [
      "score",
      "size"
    ],
    "active": true
  }
]
```
