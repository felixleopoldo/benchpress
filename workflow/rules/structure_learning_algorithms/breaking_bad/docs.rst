Breaking Bad :footcite:t:`park2026breaking` proposes **parent deletion**, a perturbation operator for
score-based causal discovery that deletes all incoming edges of a target node (or of an entire
undirected component) at once. It is combined with existing score-based search methods -- GES,
XGES :footcite:t:`nazaret2021extremely`, OPS, and `LGES <https://github.com/CausalAILab/lges>`_ --
inside an Iterated Local Search (ILS) framework, and scores candidate DAGs with a Gaussian BIC score
adapted from XGES :footcite:t:`nazaret2021extremely`.

This module wraps the ``Search`` C++ binary from
`LGAI-Research/breaking-bad <https://github.com/LGAI-Research/breaking-bad>`_.

``baseline`` selects the base search algorithm (``ges``, ``xges``, ``ops``, ``lges-safe``, or
``lges-cons``). ``variant`` selects the perturbation strategy on top of it, 0 through 3, where 2 is
the paper's proposed component-wise parent-deletion (DP) operator (Algorithm 2) and 3 additionally
schedules single-node and single-edge phases after it. ``alpha`` is the BIC penalty parameter, and
``delete_op`` is passed straight through to ``Search --delete_op``.

The ``boss`` baseline is **not** supported by this module: it requires an initial graph produced
beforehand by BOSS (part of the Tetrad library), a separate, external step this module does not cover.

.. rubric:: Example

Config file: `breaking_bad.json <https://github.com/felixleopoldo/benchpress/blob/master/workflow/rules/structure_learning_algorithms/breaking_bad/breaking_bad.json>`_

Command:

.. code:: bash

    snakemake --cores all --use-singularity --configfile workflow/rules/structure_learning_algorithms/breaking_bad/breaking_bad.json

:numref:`bbtime20`, :numref:`bbf120` and :numref:`bbtpr20` show timings, F1 (pattern graph), and
FP/P vs. TP/P (pattern graph) for GES-DP (``breakingbad-ges-dp``), vanilla GES
(``breakingbad-ges-vanilla``), and FGES (``fges-sem-bic``), based on 20 realisations of a 20-variable
random Gaussian SEM with an average indegree of 4 (300 samples each). :numref:`bbtime80`,
:numref:`bbf180` and :numref:`bbtpr80` show the same for an 80-variable version of the same setup
(640 samples each).

.. raw:: html

    <div style="display: flex; gap: 1em; flex-wrap: wrap;">

.. _bbtime20:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/breaking_bad/images/time_p20.png
    :width: 320
    :alt: Timings, 20 variables

    Timings, 20 variables.

.. _bbtime80:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/breaking_bad/images/time_p80.png
    :width: 320
    :alt: Timings, 80 variables

    Timings, 80 variables.

.. raw:: html

    </div>

.. raw:: html

    <div style="display: flex; gap: 1em; flex-wrap: wrap;">

.. _bbf120:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/breaking_bad/images/f1_pattern_p20.png
    :width: 320
    :alt: F1 (pattern graph), 20 variables

    F1 (pattern graph), 20 variables.

.. _bbf180:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/breaking_bad/images/f1_pattern_p80.png
    :width: 320
    :alt: F1 (pattern graph), 80 variables

    F1 (pattern graph), 80 variables.

.. raw:: html

    </div>

.. raw:: html

    <div style="display: flex; gap: 1em; flex-wrap: wrap;">

.. _bbtpr20:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/breaking_bad/images/tprfpr_pattern_p20.png
    :width: 320
    :alt: FP/P vs. TP/P (pattern graph), 20 variables

    FP/P vs. TP/P (pattern graph), 20 variables.

.. _bbtpr80:

.. figure:: ../../../workflow/rules/structure_learning_algorithms/breaking_bad/images/tprfpr_pattern_p80.png
    :width: 320
    :alt: FP/P vs. TP/P (pattern graph), 80 variables

    FP/P vs. TP/P (pattern graph), 80 variables.

.. raw:: html

    </div>
