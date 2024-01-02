

.. _trilearn_cta: 

trilearn_cta 
----------------

.. rubric:: CTA

.. list-table:: 

   * - Package
     - `trilearn <https://github.com/felixleopoldo/trilearn>`__
   * - Version
     - 2.0.4
   * - Language
     - `Python <https://www.python.org/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`olsson2022sequential`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/trilearn:2.0.4.0 <https://hub.docker.com/r/bpimages/trilearn/tags>`__

   * - Module
     - `trilearn_cta <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/graph/trilearn_cta>`__



.. rubric:: Description


This is the Christmas tree algorithm (CTA) for generating decomposable graph implemented in the PyPi package `trilearn <https://pypi.org/project/trilearn/>`_.
This algortihm generates a decomposable graph iteratively one node at a time by making use of the junction tree represenantation.
``alpha`` and ``beta`` are sparsity parameters, where
``beta`` is the probabilty of creatinging a new node in each iteration isolated. 
``alpha`` is the probabilty of connecting the new node in each iteration to another clique in a random tree traversal, given that is is not isolated (which is controlled by ``beta``).
In summary, high values of ``alpha``, ``beta`` give denser graphs.


.. rubric:: Example


.. code-block:: json


    [
      {
        "id": "trilearn_cta",
        "order": 50,
        "alpha": 0.5,
        "beta": 0.7
      }
    ]

.. footbibliography::

