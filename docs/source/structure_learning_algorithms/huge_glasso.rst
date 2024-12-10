


    .. meta::
        :title: Graphical lasso 
        :description: Abstract: We consider the problem of estimating sparse graphs by a lasso penalty applied to the inverse covariance matrix. Using a coordinate descent procedure for the lasso, we develop a simple algorithm—the graphical lasso—that is remarkably fast: It solves a 1000-node problem (∼500000 parameters) in at most a minute and is 30–4000 times faster than competing methods. It also provides a conceptual link between the exact problem and the approximation suggested by Meinshausen and Bühlmann (2006). We illustrate the method on some cell-signaling data from proteomics.
    

.. _huge_glasso: 

huge_glasso 
***************



.. list-table:: 

   * - Package
     - `huge <https://cran.r-project.org/web/packages/huge/index.html>`__
   * - Version
     - 1.3.5
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://cran.r-project.org/web/packages/huge/huge.pdf>`__
   * - Paper
     - :footcite:t:`zhao2012huge`, :footcite:t:`friedman2008sparse`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/huge:1.3.5 <https://hub.docker.com/r/bpimages/huge/tags>`__

   * - Module folder
     - `huge_glasso <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/huge_glasso>`__



Graphical lasso 
-------------------


Abstract: We consider the problem of estimating sparse graphs by a lasso penalty applied to the inverse covariance matrix. Using a coordinate descent procedure for the lasso, we develop a simple algorithm—the graphical lasso—that is remarkably fast: It solves a 1000-node problem (∼500000 parameters) in at most a minute and is 30–4000 times faster than competing methods. It also provides a conceptual link between the exact problem and the approximation suggested by Meinshausen and Bühlmann (2006). We illustrate the method on some cell-signaling data from proteomics.

.. rubric:: Some fields described 
* ``lambda`` A positive number to control the regularization. Typical usage is to leave the input lambda: null and have the program compute its own. 
* ``nlambda`` The number of regularization/thresholding parameters. The default value is 10 
* ``select_criterion`` Model selection criterion. ric, stars, and ebic are available. The default value is ric. 


.. rubric:: Example JSON


.. code-block:: json


    [
      [
        {
          "id": "huge_glasso",
          "lambda": [
            2,
            1,
            0.8,
            0.6,
            0.4,
            0.2,
            0.1,
            0.05,
            0.01
          ],
          "nlambda": null,
          "select_criterion": "ebic",
          "timeout": null
        }
      ]
    ]

.. footbibliography::

