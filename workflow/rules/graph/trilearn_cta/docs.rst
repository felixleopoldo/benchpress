
This is the Christmas tree algorithm (CTA) for generating decomposable graph implemented in the PyPi package `trilearn <https://pypi.org/project/trilearn/>`_.
This algortihm generates a decomposable graph iteratively one node at a time by making use of the junction tree represenantation.
``alpha`` and ``beta`` are sparsity parameters, where
``beta`` is the probabilty of creatinging a new node in each iteration isolated. 
``alpha`` is the probabilty of connecting the new node in each iteration to another clique in a random tree traversal, given that is is not isolated (which is controlled by ``beta``).
In summary, high values of ``alpha``, ``beta`` give denser graphs.
