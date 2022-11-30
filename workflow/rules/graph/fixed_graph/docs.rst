
Fixed graphs are stored as adjacency matrices of in ``.csv`` format in the directory *resources/adjmats/myadjmats* along with the `existing ones <https://github.com/felixleopoldo/benchpress/tree/master/resources/adjmat/myadjmats>`_.
A fixed graph is referenced by the corresponding filename instead of `id` as with the other modules.

A graph :math:`G` is represented as adjacency matrix :math:`M`, where :math:`M_{ij}=1` if :math:`(i,j)\in E` and  :math:`M_{ij}=0` if :math:`(i,j)\notin E`.

.. * The first row contains the labels of the variables.
.. * The columns are separated by a comma (,).
.. * 1 (0) at row i, column j indicates an (no) edge from variable i to j. 


.. rubric:: Example (undirected graph)

Below is an example undirected graph :math:`G=(V, E)`, where :math:`E = \{(a,b), (a,c), (c,d)\}` are interpreted as un-ordered pairs (un-directed edges).
Undirected graphs have symmetric matrices.

.. code-block:: text

    a,b,c,d
    0,1,1,0
    1,0,0,0
    1,0,0,1
    0,0,1,0


.. rubric:: Example (DAG)

If :math:`G` is directed the adjacency matrix is asymmetric as below.

.. code-block:: text

    a,b,c,d
    0,1,1,0
    0,0,0,0
    0,0,0,1
    0,0,0,0