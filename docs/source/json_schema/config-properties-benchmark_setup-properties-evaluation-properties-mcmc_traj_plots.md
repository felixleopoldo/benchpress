# mcmc\_traj\_plots Schema

```txt
http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots
```

This module plots the so called score values in the trajectory or the value of a given functional. The currently supported functionals are the number of edges for the graphs (size) and the graph score. The mcmc\_traj\_plots module has a list of objects, where each object has an id field for the algorithm object id, a burn-in field (burn\_in) and a field specifying the functional to be considered (functional). Since the trajectories tend to be very long, the user may choose to thin out the trajectory by only considering every graph at a given interval length specified by the thinning field. The plots are saved in results/mcmc\_traj\_plots/ and copied to results/output/mcmc\_traj\_plots/.

| Abstract            | Extensible | Status         | Identifiable            | Custom Properties | Additional Properties | Access Restrictions | Defined In                                                        |
| :------------------ | :--------- | :------------- | :---------------------- | :---------------- | :-------------------- | :------------------ | :---------------------------------------------------------------- |
| Can be instantiated | No         | Unknown status | Unknown identifiability | Forbidden         | Allowed               | none                | [config.schema.json\*](config.schema.json "open original schema") |

## mcmc\_traj\_plots Type

`object[]` ([mcmc\_traj\_plots item](config-definitions-mcmc_traj_plots-item.md))

## mcmc\_traj\_plots Examples

```json
[
  {
    "id": "omcmc_itsample-bge",
    "burn_in": 0,
    "thinning": 1,
    "functional": [
      "score",
      "size"
    ],
    "active": true
  }
]
```
