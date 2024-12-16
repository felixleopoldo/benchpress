


:og:description: Abstract :footcite:p:`10.2307/43304539`: Full Bayesian computational inference for model determination in undirected graphical models is currently restricted to decomposable graphs or other special cases, except for small-scale problems, say up to 15 variables. In this paper we develop new, more efficient methodology for such inference, by making two contributions to the computational geometry of decomposable graphs. The first of these provides sufficient conditions under which it is possible to completely connect two disconnected complete subsets of vertices, or perform the reverse procedure, yet maintain decomposability of the graph. The second is a new Markov chain Monte Carlo sampler for arbitrary positive distributions on decomposable graphs, taking a junction tree representing the graph as its state variable. 
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
 
.. meta::
    :title: Chordal graph samplers 
    :description: Abstract :footcite:p:`10.2307/43304539`: Full Bayesian computational inference for model determination in undirected graphical models is currently restricted to decomposable graphs or other special cases, except for small-scale problems, say up to 15 variables. In this paper we develop new, more efficient methodology for such inference, by making two contributions to the computational geometry of decomposable graphs. The first of these provides sufficient conditions under which it is possible to completely connect two disconnected complete subsets of vertices, or perform the reverse procedure, yet maintain decomposability of the graph. The second is a new Markov chain Monte Carlo sampler for arbitrary positive distributions on decomposable graphs, taking a junction tree representing the graph as its state variable. 


.. _athomas_jtsamplers: 

athomas_jtsamplers 
**********************



.. list-table:: 

   * - Package
     - `Alun Thomas <https://medicine.utah.edu/faculty/alun-thomas>`__
   * - Version
     - 76ad20e
   * - Language
     - `Java <https://www.java.com/en/>`__
   * - Docs
     - 
   * - Paper
     - :footcite:t:`10.1093/biomet/86.4.785`, :footcite:t:`10.2307/43304539`
   * - Graph type
     - `DG <https://en.wikipedia.org/wiki/Chordal_graph>`__
   * - Docker 
     - `bpimages/athomas_jtsamplers:9eb505f <https://hub.docker.com/r/bpimages/athomas_jtsamplers/tags>`__

   * - Module folder
     - `athomas_jtsamplers <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/athomas_jtsamplers>`__



Chordal graph samplers 
--------------------------


Abstract :footcite:p:`10.2307/43304539`: Full Bayesian computational inference for model determination in undirected graphical models is currently restricted to decomposable graphs or other special cases, except for small-scale problems, say up to 15 variables. In this paper we develop new, more efficient methodology for such inference, by making two contributions to the computational geometry of decomposable graphs. The first of these provides sufficient conditions under which it is possible to completely connect two disconnected complete subsets of vertices, or perform the reverse procedure, yet maintain decomposability of the graph. The second is a new Markov chain Monte Carlo sampler for arbitrary positive distributions on decomposable graphs, taking a junction tree representing the graph as its state variable. 

.. rubric:: Some fields described 
* ``edge_penalty`` Set the edge penalty in the prior. 
* ``num_samples`` The number of MCMC iterations. 
* ``sampler`` Set the sampler to the one indexed by: 0 = Giudicci & Green (1999) sampler. 1 = Green & Thomas (2013) single edge junction tree sampler. 2 = Green & Thomas (2013) multiple edge junction tree sampler.  
* ``size_maxclique`` Set the maximum clique size. 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "gg99",
        "burnin_frac": 0.5,
        "mcmc_estimator": "map",
        "timeout": null,
        "threshold": 0.5,
        "mcmc_seed": 1,
        "num_samples": 10000,
        "sampler": 0,
        "edge_penalty": 1.0,
        "size_maxclique": 10000
      }
    ]

.. footbibliography::

