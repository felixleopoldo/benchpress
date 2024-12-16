


:og:description: Abstract: Gaussian graphical models (GGMs) are frequently used to explore networks, such as gene regulatory networks, among a set of variables. Under the classical theory of GGMs, the construction of Gaussian graphical networks amounts to finding the pairs of variables with nonzero partial correlation coefficients. However, this is infeasible for high-dimensional problems for which the number of variables is larger than the sample size. In this article, we propose a new measure of partial correlation coefficient, which is evaluated with a reduced conditional set and thus feasible for high-dimensional problems. Under the Markov property and adjacency faithfulness conditions, the new measure of partial correlation coefficient is equivalent to the true partial correlation coefficient in construction of Gaussian graphical networks. Based on the new measure of partial correlation coefficient, we propose a multiple hypothesis test-based method for the construction of Gaussian graphical networks. Furthermore, we establish the consistency of the proposed method under mild conditions. The proposed method outperforms the existing methods, such as the PC, graphical Lasso, nodewise regression, and qp-average methods, especially for the problems for which a large number of indirect associations are present. The proposed method has a computational complexity of nearly O(p2), and is flexible in data integration, network comparison, and covariate adjustment. 
:og:image:alt: Benchpress logo
:og:sitename: Benchpress causal discovery platform
 
.. meta::
    :title: Psi-learning 
    :description: Abstract: Gaussian graphical models (GGMs) are frequently used to explore networks, such as gene regulatory networks, among a set of variables. Under the classical theory of GGMs, the construction of Gaussian graphical networks amounts to finding the pairs of variables with nonzero partial correlation coefficients. However, this is infeasible for high-dimensional problems for which the number of variables is larger than the sample size. In this article, we propose a new measure of partial correlation coefficient, which is evaluated with a reduced conditional set and thus feasible for high-dimensional problems. Under the Markov property and adjacency faithfulness conditions, the new measure of partial correlation coefficient is equivalent to the true partial correlation coefficient in construction of Gaussian graphical networks. Based on the new measure of partial correlation coefficient, we propose a multiple hypothesis test-based method for the construction of Gaussian graphical networks. Furthermore, we establish the consistency of the proposed method under mild conditions. The proposed method outperforms the existing methods, such as the PC, graphical Lasso, nodewise regression, and qp-average methods, especially for the problems for which a large number of indirect associations are present. The proposed method has a computational complexity of nearly O(p2), and is flexible in data integration, network comparison, and covariate adjustment. 


.. _equsa_psilearner: 

equsa_psilearner 
********************



.. list-table:: 

   * - Package
     - `equSA <https://rdrr.io/cran/equSA/>`__
   * - Version
     - 1.2.1
   * - Language
     - `R <https://www.r-project.org/>`__
   * - Docs
     - `here <https://rdrr.io/cran/equSA/man/>`__
   * - Paper
     - :footcite:t:`liang2015equivalent`, :footcite:t:`liang2008estimating`
   * - Graph type
     - `UG <https://en.wikipedia.org/wiki/Graph_(discrete_mathematics)#Graph>`__
   * - Docker 
     - `bpimages/equsa_psilearner:1.2.1 <https://hub.docker.com/r/bpimages/equsa_psilearner/tags>`__

   * - Module folder
     - `equsa_psilearner <https://github.com/felixleopoldo/benchpress/tree/master/workflow/rules/structure_learning_algorithms/equsa_psilearner>`__



Psi-learning 
----------------


Abstract: Gaussian graphical models (GGMs) are frequently used to explore networks, such as gene regulatory networks, among a set of variables. Under the classical theory of GGMs, the construction of Gaussian graphical networks amounts to finding the pairs of variables with nonzero partial correlation coefficients. However, this is infeasible for high-dimensional problems for which the number of variables is larger than the sample size. In this article, we propose a new measure of partial correlation coefficient, which is evaluated with a reduced conditional set and thus feasible for high-dimensional problems. Under the Markov property and adjacency faithfulness conditions, the new measure of partial correlation coefficient is equivalent to the true partial correlation coefficient in construction of Gaussian graphical networks. Based on the new measure of partial correlation coefficient, we propose a multiple hypothesis test-based method for the construction of Gaussian graphical networks. Furthermore, we establish the consistency of the proposed method under mild conditions. The proposed method outperforms the existing methods, such as the PC, graphical Lasso, nodewise regression, and qp-average methods, especially for the problems for which a large number of indirect associations are present. The proposed method has a computational complexity of nearly O(p2), and is flexible in data integration, network comparison, and covariate adjustment.


.. rubric:: Some fields described 
* ``alpha1`` The significance level of correlation screening. In general, a high significance level of correlation screening will lead to a slightly large separator. 
* ``alpha2`` The significance level of ψ screening. 
* ``grid`` The number of components for the ψ scores. The default value is 2. 
* ``iterations`` Number of iterations for screening. The default value is 100. 
* ``neig`` Neiborhood size in correlation screening step, default to n/log(n), where n is the number of observation. 


.. rubric:: Example JSON


.. code-block:: json


    [
      {
        "id": "psilearn",
        "timeout": null,
        "alpha1": 0.05,
        "alpha2": 0.05,
        "grid": 2,
        "iterations": 100,
        "neig": 10
      }
    ]

.. footbibliography::

