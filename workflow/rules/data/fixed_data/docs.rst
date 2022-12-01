

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