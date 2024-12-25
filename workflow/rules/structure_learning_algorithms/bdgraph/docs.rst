Abstract: Graphical models provide powerful tools to uncover complicated patterns in multivariate data and are commonly used in Bayesian statistics and machine learning. In this
paper, we introduce the R package BDgraph which performs Bayesian structure learning for general undirected graphical models (decomposable and non-decomposable) with
continuous, discrete, and mixed variables. The package efficiently implements recent improvements in the Bayesian literature, including that of Mohammadi and Wit (2015) :footcite:p:`mohammadi2015bayesian` and 
Dobra and Mohammadi (2018) :footcite:p:`10.1214/18-AOAS1164`. To speed up computations, the computationally intensive tasks have been implemented in C++ and interfaced with R, and the package has
parallel computing capabilities. In addition, the package contains several functions for
simulation and visualization, as well as several multivariate datasets taken from the literature and used to describe the package capabilities. The paper includes a brief overview
of the statistical methods which have been implemented in the package. The main part
of the paper explains how to use the package. Furthermore, we illustrate the package’s
functionality in both real and artificial examples.