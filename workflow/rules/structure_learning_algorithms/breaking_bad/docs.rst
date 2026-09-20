Breaking Bad :cite:`park2026breaking` proposes **parent deletion**, a perturbation operator for
score-based causal discovery that deletes all incoming edges of a target node (or of an entire
undirected component) at once. It is combined with existing score-based search methods -- GES,
XGES :cite:`nazaret2021extremely`, OPS, and `LGES <https://github.com/CausalAILab/lges>`_ -- inside
an Iterated Local Search (ILS) framework, and scores candidate DAGs with a Gaussian BIC score adapted
from XGES :cite:`nazaret2021extremely`.

This module wraps the ``Search`` C++ binary from
`LGAI-Research/breaking-bad <https://github.com/LGAI-Research/breaking-bad>`_.

``baseline`` selects the base search algorithm (``ges``, ``xges``, ``ops``, ``lges-safe``, or
``lges-cons``). ``variant`` selects the perturbation strategy on top of it, 0 through 3, where 2 is
the paper's proposed component-wise parent-deletion (DP) operator (Algorithm 2) and 3 additionally
schedules single-node and single-edge phases after it. ``alpha`` is the BIC penalty parameter, and
``delete_op`` is passed straight through to ``Search --delete_op``.

The ``boss`` baseline is **not** supported by this module: it requires an initial graph produced
beforehand by BOSS (part of the Tetrad library), a separate, external step this module does not cover.
