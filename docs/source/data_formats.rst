.. _file_formats:

File formats
#############


Graph
*******


A graph :math:`G=(V, E)` is represented by its adjacency matrix :math:`M`, where :math:`M_{ij}=1` if :math:`(i,j)\in E` and  :math:`M_{ij}=0` if :math:`(i,j)\notin E`.

.. * The first row contains the labels of the variables.
.. * The columns are separated by a comma (,).
.. * 1 (0) at row i, column j indicates an (no) edge from variable i to j. 



.. rubric:: Example (undirected graph)

Below is an example undirected graph, where :math:`E = \{(a,b), (a,c), (c,d)\}` are interpreted as un-ordered pairs (un-directed edges).
Undirected graphs have symmetric matrices.

.. code-block:: text

    a,b,c,d
    0,1,1,0
    1,0,0,0
    1,0,0,1
    0,0,1,0


.. rubric:: Example (DAG)

If the graph is directed the adjacency matrix is asymmetric as below.

.. code-block:: text

    a,b,c,d
    0,1,1,0
    0,0,0,0
    0,0,0,1
    0,0,0,0


MCMC trajectory
********************************

When the output of the algorithm is a Markov chain of graphs, we store the output in a compact
form by tracking only the changes when moves are accepted, along with the corresponding
time index and the score of the resulting graph after acceptance (not the score difference).
Additionally, in the first two rows the labels of the variables, which should be read from the
data matrix, are recorded. Specifically, the first row (index -2) contains edges from the first
variable to each of the rest in the added column, where a dash (-) symbolises an undirected
edge, and a right arrow (->) a directed edge. The score column is set to 0 and removed is set
to []. The second row (index -1) has the same edges in the removed column, while the score
column is set to 0 and added is set to []. The third row (index 0) contains all the vertices in
the starting graph along with its score in the score column and [] in the removed column.

Below is an example of a trajectory of undirected graphs :math:`G_0, G_1, \dots , G_{89}` , where :math:`E_i = {(b, c),(a, d)}` for :math:`i = 0, \dots , 33, E_i = {(a, d)}` for :math:`i = 34, \dots , 88` and :math:`E_i = {(c, d),(a, d)}`
for :math:`i = 89`.

.. code-block:: text

    index,score,added,removed
    -2,0.0,[a-b;a-c;a-d],[]
    -1,0.0,[],[a-b;a-c;a-d]
    0,-2325.52,[b-c;a-d],[]
    34,-2311.94,[],[b-c]
    89,-2310.81,[c-d],[]

.. _data_formats:

Dataset
******************


Observational data
^^^^^^^^^^^^^^^^^^^

Observations should be stored as row vectors in a matrix, where the columns are separated by
commas. The first row should contain the labels of the variables and if the data is categorical,
the second row should contain the cardinality (number of levels) of each variable.

.. rubric:: Example (continuous)

Below is an example showing two samples from a continuous distribution.

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

Interventional data
^^^^^^^^^^^^^^^^^^^

Hard interventions are indicated by additional columns for the interventional variables, stacked on the right part of the data matrix.
Below is an example showing samples from a mix of observational and interventional samples from a continuous distribution.

.. rubric:: Example (continuous)


If in the continuous example above there would be two additional observations where only :math:`a` was intervened, and one when both :math:`a` and :math:`d` were intervened, it could look as below. 

.. code-block:: text

    a,b,c,d,a,d
    0.2,2.3,5.3,0.5,0,0
    3.2,1.5,2.5,1.2,0,0
    5.2,0.1,1.5,3.2,1,0
    1.2,1.2,2.2,4.2,1,0
    1.1,1.5,1.4,2.2,1,1

Missing data
*************

Missing data is indicated by the absence of a value. Below is an example of a dataset were the second row for bolumn b is missing.

.. rubric:: Example (missing data)

    a,b,c,d
    0.2,2.3,5.3,0.5
    3.2,,2.5,1.2   


Parameters
************

* Bnlearn `bn.fit` objects should be stored in `RDS` format in the directory *resources/myparams/bn.fit_networks*.
* Weight matrices for SEM models should be stored in CSV format in *resources/myparams/sem_params*.


.. note:: 

    The column labels and their order in the dataset CSV files should directly correspond to the variable names in the graph and parameters CSV files (if such files exist). 
