Graph
########


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


MCMC trajectory
######################

When the output of the algorithm is a Markov chain of graphs, we store the output in a compact
form by tracking only the changes when moves are accepted, along with the corresponding
time index and the score of the resulting graph after acceptance (not the score difference).
Additionaly, in the first two rows the labels of the variables, which should be read from the
data matrix, are recorded. Specifically, the first row (index -2) contains edges from the first
variable to each of the rest in the added column, where a dash (-) symbolises an undirected
edge, and a right arrow (->) a directed edge. The score column is set to 0 and removed is set
to []. The second row (index -1) has the same edges in the removed column, while the score
column is set to 0 and added is set to []. The third row (index 0) contains all the vertices in
the starting graph along with its score in the score column and [] in the removed column.

Below is an example of a trajectory of undirected graphs :math:`G_0, G_1, \dots , G_{89}`, where :math:`E_i = {(b, c),(a, d)}` for :math:`i = 0, \dots , 33, E_i = {(a, d)}`` for :math:`i = 34, \dots , 88` and :math:`E_i = {(c, d),(a, d)}``
for :math:`i = 89`.

.. code-block:: text

    index,score,added,removed
    -2,0.0,[a-b;a-c;a-d],[]
    -1,0.0,[],[a-b;a-c;a-d]
    0,-2325.52,[b-c;a-d],[]
    34,-2311.94,[],[b-c]
    89,-2310.81,[c-d],[]

Dataset
#################


Observations should be stored as row vectors in a matrix, where the columns are separated by
commas. The first row should contain the labels of the variables and if the data is categorical,
the second row should contain the cardinality (number of levels) of each variable.

.. rubric:: Example (continuous)

An example showing of two samples from continuous distribution is shown below.

.. code-block:: text

    a,b,c,d
    0.2,2.3,5.3,0.5
    3.2,1.5,2.5,1.2

.. rubric:: Example (categorical)

Below is a formatting example of two samples of a categorical distribution where the cardinalities
are 2,3,2, and 2.

.. code-block:: text

    a,b,c,d
    2,3,2,2
    1,2,0,1
    0,1,1,1


Parameters
###########

* Bnlearn objects `bn.fit` objects should be stored in `RDS` format in the directory *resources/myparams/bn.fit_networks*.
* Weight matrices for SEM models should be stored in CSV format in *resources/myparams/sem_params*.


.. rubric:: Example

Example standard networks mostly from the `bnlearn repository <https://www.bnlearn.com/bnrepository/>`_ are found `here <https://github.com/felixleopoldo/benchpress/tree/master/resources/parameters/myparams/bn.fit_networks>`_.


.. important::

    This must be combined with the correct graph of the network. For example, the network of ``asia.rds`` should be used with the graph ``asia.csv``, which happens the be corresponding adjacancy matrix.

