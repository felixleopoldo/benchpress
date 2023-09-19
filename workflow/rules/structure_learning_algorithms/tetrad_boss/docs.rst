Abstract: The Sparsest Permutation (SP) algorithm is accurate but limited to about 9 variables in practice; the
Greedy Sparest Permutation (GSP) algorithm is faster but less weak theoretically. A compromise can
be given, the Best Order Score Search, which gives results as accurate as SP but for much larger and
denser graphs. BOSS (Best Order Score Search) is more accurate for two reason: (a) It assumes the
“brute faithfuness” assumption, which is weaker than faithfulness, and (b) it uses a different traversal
of permutations than the depth first traversal used by GSP, obtained by taking each variable in turn and
moving it to the position in the permutation that optimizes the model score. Results are given comparing
BOSS to several related papers in the literature in terms of performance, for linear, Gaussian data. In
all cases, with the proper parameter settings, accuracy of BOSS is lifted considerably with respect to
competing approaches. In configurations tested, models with 60 variables are feasible with large samples
out to about an average degree of 12 in reasonable time, with near-perfect accuracy, and sparse models
with an average degree of 4 are feasible out to about 300 variables on a laptop, again with near-perfect
accuracy. Mixed continuous discrete and all-discrete datasets were also tested. The mixed data analysis
showed advantage for BOSS over GES more apparent at higher depths with the same score; the discrete
data analysis showed a very small advantage for BOSS over GES with the same score, perhaps not
enough to prefer it.