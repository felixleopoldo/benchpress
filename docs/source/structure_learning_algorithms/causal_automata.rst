


:og:description: JAX-accelerated cellular automaton engine for causal discovery over continuous observational data.
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
:og:title: causal-automata
 
.. meta::
    :title: causal-automata
    :description: JAX-accelerated cellular automaton engine for causal discovery over continuous observational data.


.. _causal_automata: 

causal-automata 
*****************



.. list-table:: 

   * - Module name
     - `causal_automata <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/causal_automata>`__
   * - Package
     - `causal-automata <https://pypi.org/project/causal-automata/>`__
   * - Version
     - 0.3.6
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - `here <https://pypi.org/project/causal-automata/>`__
   * - Paper
     - :footcite:t:`yamagiwa2025causalautomata`
   * - Graph type
     - `DAG <https://en.wikipedia.org/wiki/Directed_acyclic_graph>`__
   * - MCMC
     - No
   * - Edge constraints
     - No
   * - Data type
     - C
   * - Data missingness
     - 
   * - Intervention type
     - 
   * - Docker 
     - `ghcr.io/kazuyamagiwa/causal_automata:0.3.6 <https://github.com/kazuyamagiwa/benchpress/pkgs/container/causal_automata>`__




Causal Automata: GPU-native causal discovery via synchronous cellular automata in JAX 
----------------------------------------------------------------------------------------

causal-automata :footcite:t:`yamagiwa2025causalautomata` is a JAX-accelerated
cellular automaton engine for causal discovery. It evolves an adjacency matrix
and a node elevation field under synchronous gravity / V-well / death / birth
updates, compiled with XLA for CPU or GPU backends.

This module wraps ``CausalAutomaton.fit`` (preferred). With
``threshold_death`` / ``threshold_birth`` / ``skeleton_threshold`` set to
``null``, Fisher-z thresholds are calibrated from sample size and ``alpha``.

The published Benchpress container is CPU JAX. For GPU hosts, build the module
``Dockerfile.gpu`` and run with Apptainer ``--nv``.

.. rubric:: Example 

Config file: `causal_automata.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/causal_automata/causal_automata.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/causal_automata/causal_automata.json


.. rubric:: Example JSON


.. code-block:: json


    [
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

.. footbibliography::
