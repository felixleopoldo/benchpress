causal-automata :footcite:t:`yamagiwa2025causalautomata` is a JAX-accelerated
cellular automaton engine for causal discovery. It evolves an adjacency matrix
and a node elevation field under synchronous gravity / V-well / death / birth
updates, compiled with XLA for CPU or GPU backends.

This module wraps :class:`causal_automata.CausalAutomaton` (preferred) and
falls back to :func:`causal_automata.run` when an explicit
``skeleton_threshold`` is set. Continuous observations are column-standardized.
With ``threshold_death`` / ``threshold_birth`` / ``skeleton_threshold`` set to
``null``, Fisher-z thresholds are calibrated from ``n_samples`` and ``alpha``
(default ``0.01``), and the initial correlation skeleton is aligned to the
calibrated birth threshold (package ``corr_flat`` init).

The default Benchpress container is CPU JAX
(``docker://ghcr.io/kazuyamagiwa/causal_automata:0.3.6``). On GPU hosts, build
``Dockerfile.gpu`` and run Apptainer with ``--nv`` (see module ``Dockerfile.gpu``).

.. rubric:: Example

Config snippet under ``resources.structure_learning_algorithms``:

.. code:: json

    "causal_automata": [
      {
        "id": "causal_automata",
        "ticks": 100,
        "k": null,
        "learning_rate": 0.1,
        "threshold_death": null,
        "threshold_birth": null,
        "skeleton_threshold": null,
        "alpha": 0.01,
        "multihop": false,
        "fuzzy": false,
        "timeout": null
      }
    ]

Local conda test (after pointing evaluation ids at ``causal_automata``):

.. code:: bash

    snakemake --cores all --use-conda --configfile config/causal_automata_test.json
