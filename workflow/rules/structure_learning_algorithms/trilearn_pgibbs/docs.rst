Abstract: We present a sequential sampling methodology for weakly structural Markov laws, arising naturally in a Bayesian structure learning context for decomposable graphical models. As a key component of our sug-
gested approach, we show that the problem of graph estimation, which in
general lacks natural sequential interpretation, can be recast into a sequential setting by proposing a recursive Feynman-Kac model that generates
a ﬂow of junction tree distributions over a space of increasing dimensions.
We focus on particle McMC methods to provide samples on this space,
in particular on particle Gibbs (PG), as it allows for generating McMC
chains with global moves on an underlying space of decomposable graphs.
To further improve the PG mixing properties, we incorporate a systematic
refreshment step implemented through direct sampling from a backward
kernel. The theoretical properties of the algorithm are investigated, showing that the proposed refreshment step improves the performance in terms
of asymptotic variance of the estimated distribution. The suggested sampling methodology is illustrated through a collection of numerical examples
demonstrating high accuracy in Bayesian graph structure learning in both
discrete and continuous graphical models.