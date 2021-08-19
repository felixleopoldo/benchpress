 

.. _config.schema.json#/:

config.schema
=============

.. container:: title

 JSON schema for Benchpress config file.

:type: ``object``

:$id: ``http://github.com/felixleopoldo/benchpress/workflow/schemas/config.schema.json``


.. _config.schema.json#/definitions:

definitions
***********


.. _config.schema.json#/definitions/bandmat:

bandmat
+++++++

.. container:: title

 bandmat item

A graph with a band structured adjacency matrix

:Required: :ref:`config.schema.json#/definitions/bandmat/properties/id`, :ref:`config.schema.json#/definitions/bandmat/properties/dim`, :ref:`config.schema.json#/definitions/bandmat/properties/bandwidth`

**Properties:** :ref:`config.schema.json#/definitions/bandmat/properties/bandwidth`, :ref:`config.schema.json#/definitions/bandmat/properties/dim`, :ref:`config.schema.json#/definitions/bandmat/properties/id`


.. _config.schema.json#/definitions/bandmat/properties/bandwidth:

bandwidth
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bandmat/properties/dim:

dim
###

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bandmat/properties/id:

id
##

.. container:: title

 ID

:type: ``string``


.. _config.schema.json#/definitions/bdgraph_graphsim:

bdgraph_graphsim
++++++++++++++++

.. container:: title

 bdgraph_graphsim item

BDgraph graph.sim

:Required: :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/p`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/graph`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/class`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/size`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/id`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/prob`

**Properties:** :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/class`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/graph`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/id`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/p`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/prob`, :ref:`config.schema.json#/definitions/bdgraph_graphsim/properties/size`


.. _config.schema.json#/definitions/bdgraph_graphsim/properties/class:

class
#####

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/bdgraph_graphsim/properties/graph:

graph
#####

:type: ``string``

**Allowed values:** 

- random
- cluster
- scale-free
- hub
- circle
- star
- lattice


.. _config.schema.json#/definitions/bdgraph_graphsim/properties/id:

id
##

.. container:: title

 ID

:type: ``string``


.. _config.schema.json#/definitions/bdgraph_graphsim/properties/p:

p
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bdgraph_graphsim/properties/prob:

prob
####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bdgraph_graphsim/properties/size:

size
####

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/bdgraph_rgwish:

bdgraph_rgwish
++++++++++++++

.. container:: title

 bdgraph_rgwish item

Parameter setting for a G-Wishart model. Works for undirected graphs.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bdgraph_rgwish/properties/b`, :ref:`config.schema.json#/definitions/bdgraph_rgwish/properties/id`, :ref:`config.schema.json#/definitions/bdgraph_rgwish/properties/threshold`

**Properties:** :ref:`config.schema.json#/definitions/bdgraph_rgwish/properties/b`, :ref:`config.schema.json#/definitions/bdgraph_rgwish/properties/id`, :ref:`config.schema.json#/definitions/bdgraph_rgwish/properties/threshold`


.. _config.schema.json#/definitions/bdgraph_rgwish/properties/b:

b
#

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bdgraph_rgwish/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/bdgraph_rgwish/properties/threshold:

threshold
#########

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bidag_itsearch:

bidag_itsearch
++++++++++++++

.. container:: title

 bidag_itsearch item

Iterative search +1 algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bidag_itsearch/properties/MAP`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/plus1it`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/posterior`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/scoretype`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/chi`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/edgepf`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/am`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/aw`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/softlimit`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/hardlimit`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/alpha`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/gamma`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/cpdag`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/mergetype`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/estimate`

**Properties:** :ref:`config.schema.json#/definitions/bidag_itsearch/properties/MAP`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/alpha`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/am`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/aw`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/chi`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/cpdag`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/edgepf`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/estimate`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/gamma`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/hardlimit`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/id`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/mergetype`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/plus1it`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/posterior`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/scoretype`, :ref:`config.schema.json#/definitions/bidag_itsearch/properties/softlimit`


.. _config.schema.json#/definitions/bidag_itsearch/properties/MAP:

MAP
###

:type: ``boolean``


.. _config.schema.json#/definitions/bidag_itsearch/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/am:

am
##

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/aw:

aw
##

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/chi:

chi
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/cpdag:

cpdag
#####

:type: ``boolean``


.. _config.schema.json#/definitions/bidag_itsearch/properties/edgepf:

edgepf
######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/estimate:

estimate
########

:type: ``string``

**Allowed values:** 

- map
- endspace


.. _config.schema.json#/definitions/bidag_itsearch/properties/gamma:

gamma
#####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/hardlimit:

hardlimit
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bidag_itsearch/properties/mergetype:

mergetype
#########

:type: ``string``

**Allowed values:** 

- skeleton


.. _config.schema.json#/definitions/bidag_itsearch/properties/plus1it:

plus1it
#######

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/posterior:

posterior
#########

:Reference: :ref:`flexprobnull#/`


.. _config.schema.json#/definitions/bidag_itsearch/properties/scoretype:

scoretype
#########

:type: ``string``


.. _config.schema.json#/definitions/bidag_itsearch/properties/softlimit:

softlimit
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bidag_order_mcmc:

bidag_order_mcmc
++++++++++++++++

.. container:: title

 bidag_order_mcmc item

Order MCMC algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/scoretype`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/chi`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/edgepf`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/am`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/aw`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/threshold`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/burnin`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/plus1`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/MAP`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/stepsave`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/iterations`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/gamma`

**Properties:** :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/MAP`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/alpha`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/am`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/aw`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/burnin`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/chi`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/cpdag`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/edgepf`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/gamma`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/id`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/iterations`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/mcmc_seed`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/plus1`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/scoretype`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/stepsave`, :ref:`config.schema.json#/definitions/bidag_order_mcmc/properties/threshold`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/MAP:

MAP
###

:type: ``boolean``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/alpha:

alpha
#####

:Reference: :ref:`flexprobnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/am:

am
##

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/aw:

aw
##

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/burnin:

burnin
######

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/chi:

chi
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/cpdag:

cpdag
#####

:type: ``boolean``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/edgepf:

edgepf
######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/gamma:

gamma
#####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/iterations:

iterations
##########

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/mcmc_seed:

mcmc_seed
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/plus1:

plus1
#####

:type: ``boolean``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/scoretype:

scoretype
#########

:type: ``string``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm:

startspace_algorithm
####################

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm/anyOf/0:

0
>

:type: ``string``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm/anyOf/1:

1
>

:type: ``null``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/startspace_algorithm/anyOf/2:

2
>

:type: ``array``

.. container:: sub-title

 Every element of **2**  is:

:type: ``string``


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/stepsave:

stepsave
########

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bidag_order_mcmc/properties/threshold:

threshold
#########

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bin_bn:

bin_bn
++++++

.. container:: title

 bin_bn item

Parameter setting for generateBinaryBN

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bin_bn/properties/min`, :ref:`config.schema.json#/definitions/bin_bn/properties/max`, :ref:`config.schema.json#/definitions/bin_bn/properties/id`

**Properties:** :ref:`config.schema.json#/definitions/bin_bn/properties/id`, :ref:`config.schema.json#/definitions/bin_bn/properties/max`, :ref:`config.schema.json#/definitions/bin_bn/properties/min`


.. _config.schema.json#/definitions/bin_bn/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/bin_bn/properties/max:

max
###

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bin_bn/properties/min:

min
###

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bnlearn_gs:

bnlearn_gs
++++++++++

.. container:: title

 bnlearn_gs item

Grow shrink (GS) algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bnlearn_gs/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/alpha`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/test`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/B`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/maxsx`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/debug`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/undirected`

**Properties:** :ref:`config.schema.json#/definitions/bnlearn_gs/properties/B`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/alpha`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/debug`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/maxsx`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/test`, :ref:`config.schema.json#/definitions/bnlearn_gs/properties/undirected`


.. _config.schema.json#/definitions/bnlearn_gs/properties/B:

B
#

:Reference: :ref:`flexnatnumnull#/`


.. _config.schema.json#/definitions/bnlearn_gs/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bnlearn_gs/properties/debug:

debug
#####

:type: ``boolean``


.. _config.schema.json#/definitions/bnlearn_gs/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_gs/properties/maxsx:

maxsx
#####

:Reference: :ref:`flexnatnumnull#/`


.. _config.schema.json#/definitions/bnlearn_gs/properties/test:

test
####

:type: ``string``

**Allowed values:** 

- mi
- mi-adf
- mc-mi
- smc-mi
- sp-mi
- mi-sh
- x2
- x2-adf
- sp-x2
- jt
- mc-jt
- smc-jt
- cor
- mc-cor
- smc-cor
- zf
- mc-zf
- smc-zf
- mi-g
- mc-mi-g
- smc-mi-g
- mi-g-sh
- mi-cg


.. _config.schema.json#/definitions/bnlearn_gs/properties/undirected:

undirected
##########

:type: ``boolean``


.. _config.schema.json#/definitions/bnlearn_hc:

bnlearn_hc
++++++++++

.. container:: title

 bnlearn_hc item

HC algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bnlearn_hc/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/beta`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/score`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/iss`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/issmu`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/l`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/k`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/prior`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/perturb`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/restart`

**Properties:** :ref:`config.schema.json#/definitions/bnlearn_hc/properties/beta`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/iss`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/issmu`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/issw`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/k`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/l`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/perturb`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/prior`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/restart`, :ref:`config.schema.json#/definitions/bnlearn_hc/properties/score`


.. _config.schema.json#/definitions/bnlearn_hc/properties/beta:

beta
####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_hc/properties/iss:

iss
###

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/issmu:

issmu
#####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/issw:

issw
####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/k:

k
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/l:

l
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/perturb:

perturb
#######

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/prior:

prior
#####

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_hc/properties/restart:

restart
#######

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bnlearn_hc/properties/score:

score
#####

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_interiamb:

bnlearn_interiamb
+++++++++++++++++

.. container:: title

 bnlearn_interiamb item

Inter-IAMB algorithm object

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/alpha`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/test`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/B`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/maxsx`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/debug`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/undirected`

**Properties:** :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/B`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/alpha`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/debug`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/maxsx`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/plot_legend`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/test`, :ref:`config.schema.json#/definitions/bnlearn_interiamb/properties/undirected`


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/B:

B
#

:Reference: :ref:`flexnatnumnull#/`


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/debug:

debug
#####

:type: ``boolean``


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/maxsx:

maxsx
#####

:Reference: :ref:`flexnatnumnull#/`


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/plot_legend:

plot_legend
###########

Legend to show in plotting

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/test:

test
####

:type: ``string``

**Allowed values:** 

- mi
- mi-adf
- mc-mi
- smc-mi
- sp-mi
- mi-sh
- x2
- x2-adf
- sp-x2
- jt
- mc-jt
- smc-jt
- cor
- mc-cor
- smc-cor
- zf
- mc-zf
- smc-zf
- mi-g
- mc-mi-g
- smc-mi-g
- mi-g-sh
- mi-cg


.. _config.schema.json#/definitions/bnlearn_interiamb/properties/undirected:

undirected
##########

:type: ``boolean``


.. _config.schema.json#/definitions/bnlearn_mmhc:

bnlearn_mmhc
++++++++++++

.. container:: title

 bnlearn_mmhc item

MMHC algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/alpha`

**Properties:** :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/alpha`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/beta`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/iss`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/issmu`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/issw`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/k`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/l`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/prior`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/score`, :ref:`config.schema.json#/definitions/bnlearn_mmhc/properties/test`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/beta:

beta
####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/iss:

iss
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/issmu:

issmu
#####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/issw:

issw
####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/k:

k
#

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/l:

l
#

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/prior:

prior
#####

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/score:

score
#####

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_mmhc/properties/test:

test
####

:type: ``string``

**Allowed values:** 

- mi
- mi-adf
- mc-mi
- smc-mi
- sp-mi
- mi-sh
- x2
- x2-adf
- sp-x2
- jt
- mc-jt
- smc-jt
- cor
- mc-cor
- smc-cor
- zf
- mc-zf
- smc-zf
- mi-g
- mc-mi-g
- smc-mi-g
- mi-g-sh
- mi-cg


.. _config.schema.json#/definitions/bnlearn_tabu:

bnlearn_tabu
++++++++++++

.. container:: title

 bnlearn_tabu item

TABU algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/beta`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/score`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/iss`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/issmu`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/l`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/k`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/prior`

**Properties:** :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/beta`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/id`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/iss`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/issmu`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/issw`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/k`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/l`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/prior`, :ref:`config.schema.json#/definitions/bnlearn_tabu/properties/score`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/beta:

beta
####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_tabu/properties/iss:

iss
###

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/issmu:

issmu
#####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/issw:

issw
####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/k:

k
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/l:

l
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/bnlearn_tabu/properties/prior:

prior
#####

:type: ``string``


.. _config.schema.json#/definitions/bnlearn_tabu/properties/score:

score
#####

:type: ``string``


.. _config.schema.json#/definitions/data_setup_dict:

data_setup_dict
+++++++++++++++

.. container:: title

 data item

Description of the data model and sampling setup. Make sure that the id's are properly combined.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/data_setup_dict/properties/graph_id`, :ref:`config.schema.json#/definitions/data_setup_dict/properties/parameters_id`, :ref:`config.schema.json#/definitions/data_setup_dict/properties/data_id`, :ref:`config.schema.json#/definitions/data_setup_dict/properties/seed_range`

**Properties:** :ref:`config.schema.json#/definitions/data_setup_dict/properties/data_id`, :ref:`config.schema.json#/definitions/data_setup_dict/properties/graph_id`, :ref:`config.schema.json#/definitions/data_setup_dict/properties/parameters_id`, :ref:`config.schema.json#/definitions/data_setup_dict/properties/seed_range`


.. _config.schema.json#/definitions/data_setup_dict/properties/data_id:

data_id
#######

.. container:: title

 data_id

Data sampling method ID.

:type: ``string``


.. _config.schema.json#/definitions/data_setup_dict/properties/graph_id:

graph_id
########

.. container:: title

 graph_id

ID of the graph object.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/data_setup_dict/properties/graph_id/anyOf/0:

0
>

:type: ``string``


.. _config.schema.json#/definitions/data_setup_dict/properties/graph_id/anyOf/1:

1
>

:type: ``null``


.. _config.schema.json#/definitions/data_setup_dict/properties/parameters_id:

parameters_id
#############

.. container:: title

 parameters_id

ID of a module object in the parameters section.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/data_setup_dict/properties/parameters_id/anyOf/0:

0
>

:type: ``string``


.. _config.schema.json#/definitions/data_setup_dict/properties/parameters_id/anyOf/1:

1
>

:type: ``null``


.. _config.schema.json#/definitions/data_setup_dict/properties/seed_range:

seed_range
##########

.. container:: title

 seed_range

This data setup will be simulated for this range of seeds. E.g. seed_range:[1,3] will generate 3 datsets (and corresponding models) with seeds 1,2,3.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/data_setup_dict/properties/seed_range/anyOf/1:

1
>

:type: ``null``


.. _config.schema.json#/definitions/data_setup_dict/properties/seed_range/anyOf/0:

range
>>>>>

List of 2 integers [a, b], where a<=b.

:type: ``array``


.. _config.schema.json#/definitions/data_setup_dict/properties/seed_range/anyOf/0/title:




:maxLength: ``2``

:minLength: ``2``

.. container:: sub-title

 Every element of **range**  is:

:type: ``integer``


.. _config.schema.json#/definitions/flexnatnum:

flexnatnum
++++++++++

.. container:: title

 Non-negative integer(s)

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnatnum/anyOf/0:

0
#

:Reference: :ref:`natnum#/`


.. _config.schema.json#/definitions/flexnatnum/anyOf/1:

Positive integer list
#####################

:type: ``array``


.. _config.schema.json#/definitions/flexnatnum/anyOf/1/title:




.. container:: sub-title

 Every element of **Positive integer list**  is:

:Reference: :ref:`natnum#/`


.. _config.schema.json#/definitions/flexnatnumnull:

flexnatnumnull
++++++++++++++

.. container:: title

 Npn-negative integer or null

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnatnumnull/anyOf/0:

0
#

:Reference: :ref:`flexnatnum#/`


.. _config.schema.json#/definitions/flexnatnumnull/anyOf/1:

1
#

:type: ``null``


.. _config.schema.json#/definitions/flexnonnegint:

flexnonnegint
+++++++++++++

.. container:: title

 Non-negative integer(s)

Non-negative integers, (0,1,2,...), or array of the same.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnonnegint/anyOf/0:

0
#

:Reference: :ref:`nonnegint#/`


.. _config.schema.json#/definitions/flexnonnegint/anyOf/1:

1
#

:Reference: :ref:`nonnegintlist#/`


.. _config.schema.json#/definitions/flexnonnegintnull:

flexnonnegintnull
+++++++++++++++++

.. container:: title

 Non-negative integer(s), or null.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnonnegintnull/anyOf/0:

0
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/flexnonnegintnull/anyOf/1:

1
#

:type: ``null``


.. _config.schema.json#/definitions/flexnonnegintstring:

flexnonnegintstring
+++++++++++++++++++

.. container:: title

 flexnonnegintstring

Non-negative integer(s), or Inf string.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnonnegintstring/anyOf/0:

0
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/flexnonnegintstring/anyOf/1:

1
#

:type: ``string``

**Allowed values:** 

- Inf


.. _config.schema.json#/definitions/flexnonnegnum:

flexnonnegnum
+++++++++++++

Non-negative number(s).

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnonnegnum/anyOf/0:

0
#

:Reference: :ref:`nonnegnum#/`


.. _config.schema.json#/definitions/flexnonnegnum/anyOf/1:

1
#

:Reference: :ref:`nonnegnumlist#/`


.. _config.schema.json#/definitions/flexnonnegnumnull:

flexnonnegnumnull
+++++++++++++++++

.. container:: title

 Non-negative number(s) or null

E.g. 1.5 or [1.6, 3.8] or null.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexnonnegnumnull/anyOf/0:

0
#

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/flexnonnegnumnull/anyOf/1:

1
#

:type: ``null``


.. _config.schema.json#/definitions/flexprob:

flexprob
++++++++

Number(s) in the range [0,1].

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexprob/anyOf/0:

0
#

:Reference: :ref:`prob#/`


.. _config.schema.json#/definitions/flexprob/anyOf/1:

1
#

:Reference: :ref:`problist#/`


.. _config.schema.json#/definitions/flexprobnull:

flexprobnull
++++++++++++

.. container:: title

 flexprobnull

Number(s) in the range [0,1], or null.

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/flexprobnull/anyOf/0:

0
#

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/flexprobnull/anyOf/1:

1
#

:type: ``null``


.. _config.schema.json#/definitions/gg99_singlepair:

gg99_singlepair
+++++++++++++++

.. container:: title

 gg99_singlepair item

Guidici & Green algorithm for learning decomopasble graphs.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/gg99_singlepair/properties/id`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/n_samples`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/prior`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/mcmc_seed`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/randomits`

**Properties:** :ref:`config.schema.json#/definitions/gg99_singlepair/properties/ascore`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/bscore`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/clq`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/datatype`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/id`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/mcmc_seed`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/n_samples`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/penalty`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/prior`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/randomits`, :ref:`config.schema.json#/definitions/gg99_singlepair/properties/sep`


.. _config.schema.json#/definitions/gg99_singlepair/properties/ascore:

ascore
######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/bscore:

bscore
######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/clq:

clq
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/datatype:

datatype
########

:type: ``string``

**Allowed values:** 

- discrete
- continuous


.. _config.schema.json#/definitions/gg99_singlepair/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/gg99_singlepair/properties/mcmc_seed:

mcmc_seed
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/n_samples:

n_samples
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/penalty:

penalty
#######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/prior:

prior
#####

:type: ``string``


.. _config.schema.json#/definitions/gg99_singlepair/properties/randomits:

randomits
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gg99_singlepair/properties/sep:

sep
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gobnilp:

gobnilp
+++++++

.. container:: title

 gobnilp item

Gobnilp instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/gobnilp/properties/id`, :ref:`config.schema.json#/definitions/gobnilp/properties/plot`, :ref:`config.schema.json#/definitions/gobnilp/properties/palim`, :ref:`config.schema.json#/definitions/gobnilp/properties/alpha`, :ref:`config.schema.json#/definitions/gobnilp/properties/prune`

**Properties:** :ref:`config.schema.json#/definitions/gobnilp/properties/alpha`, :ref:`config.schema.json#/definitions/gobnilp/properties/alpha_mu`, :ref:`config.schema.json#/definitions/gobnilp/properties/alpha_omega_minus_nvars`, :ref:`config.schema.json#/definitions/gobnilp/properties/continuous`, :ref:`config.schema.json#/definitions/gobnilp/properties/id`, :ref:`config.schema.json#/definitions/gobnilp/properties/palim`, :ref:`config.schema.json#/definitions/gobnilp/properties/plot`, :ref:`config.schema.json#/definitions/gobnilp/properties/prune`, :ref:`config.schema.json#/definitions/gobnilp/properties/score_type`


.. _config.schema.json#/definitions/gobnilp/properties/alpha:

alpha
#####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gobnilp/properties/alpha_mu:

alpha_mu
########

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gobnilp/properties/alpha_omega_minus_nvars:

alpha_omega_minus_nvars
#######################

:Reference: :ref:`flexnatnumnull#/`


.. _config.schema.json#/definitions/gobnilp/properties/continuous:

continuous
##########

:type: ``boolean``


.. _config.schema.json#/definitions/gobnilp/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/gobnilp/properties/palim:

palim
#####

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gobnilp/properties/plot:

plot
####

:type: ``boolean``


.. _config.schema.json#/definitions/gobnilp/properties/prune:

prune
#####

:type: ``boolean``


.. _config.schema.json#/definitions/gobnilp/properties/score_type:

score_type
##########

:type: ``string``

**Allowed values:** 

- BGe
- BDeu
- BIC


.. _config.schema.json#/definitions/gt13_multipair:

gt13_multipair
++++++++++++++

.. container:: title

 gt13_multipair item

Green & Thomas algorithm for learning decomopasble graphs.
 Source: Green, P. J., & Thomas, A. (2013). Sampling decomposable graphs using a Markov chain on junction trees. Biometrika, 100(1), 91-110.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/gt13_multipair/properties/id`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/n_samples`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/prior`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/mcmc_seed`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/randomits`

**Properties:** :ref:`config.schema.json#/definitions/gt13_multipair/properties/ascore`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/bscore`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/clq`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/datatype`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/id`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/mcmc_seed`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/n_samples`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/penalty`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/prior`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/randomits`, :ref:`config.schema.json#/definitions/gt13_multipair/properties/sep`


.. _config.schema.json#/definitions/gt13_multipair/properties/ascore:

ascore
######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/bscore:

bscore
######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/clq:

clq
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/datatype:

datatype
########

:type: ``string``

**Allowed values:** 

- discrete
- continuous


.. _config.schema.json#/definitions/gt13_multipair/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/gt13_multipair/properties/mcmc_seed:

mcmc_seed
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/n_samples:

n_samples
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/penalty:

penalty
#######

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/prior:

prior
#####

:type: ``string``

**Allowed values:** 

- bc
- mbc
- ep


.. _config.schema.json#/definitions/gt13_multipair/properties/randomits:

randomits
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/gt13_multipair/properties/sep:

sep
###

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/iid:

iid
+++

.. container:: title

 iid

Data sampling from disctete Bayesian network.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/iid/properties/id`, :ref:`config.schema.json#/definitions/iid/properties/sample_sizes`, :ref:`config.schema.json#/definitions/iid/properties/standardized`

**Properties:** :ref:`config.schema.json#/definitions/iid/properties/id`, :ref:`config.schema.json#/definitions/iid/properties/sample_sizes`, :ref:`config.schema.json#/definitions/iid/properties/standardized`


.. _config.schema.json#/definitions/iid/properties/id:

id
##

.. container:: title

 Unique ID

:type: ``string``


.. _config.schema.json#/definitions/iid/properties/sample_sizes:

sample_sizes
############

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/iid/properties/standardized:

standardized
############

:type: ``boolean``


.. _config.schema.json#/definitions/mcmc_autocorr_plots:

mcmc_autocorr_plots
+++++++++++++++++++

.. container:: title

 mcmc_autocorr_plots item

Plots the auto correlation for a given functional in a MCMC trajectory.

:Required: :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/id`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/burn_in`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/thinning`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/functional`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/lags`

**Properties:** :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/active`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/burn_in`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/functional`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/id`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/lags`, :ref:`config.schema.json#/definitions/mcmc_autocorr_plots/properties/thinning`


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/active:

active
######

:type: ``boolean``


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/burn_in:

burn_in
#######

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/functional:

functional
##########

.. container:: title

 stringorlist

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/functional/anyOf/0:

0
>

:type: ``string``

**Allowed values:** 

- score
- size


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/functional/anyOf/1:

1
>

:type: ``array``

.. container:: sub-title

 Every element of **1**  is:

:type: ``string``

**Allowed values:** 

- score
- size


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/lags:

lags
####

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/mcmc_autocorr_plots/properties/thinning:

thinning
########

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/mcmc_heatmaps_item:

mcmc_heatmaps_item
++++++++++++++++++

.. container:: title

 MCMC mean graph plot

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

:Required: :ref:`config.schema.json#/definitions/mcmc_heatmaps_item/properties/id`, :ref:`config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in`

**Properties:** :ref:`config.schema.json#/definitions/mcmc_heatmaps_item/properties/active`, :ref:`config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in`, :ref:`config.schema.json#/definitions/mcmc_heatmaps_item/properties/id`


.. _config.schema.json#/definitions/mcmc_heatmaps_item/properties/active:

active
######

Set to false if you dont want to plot it.

:type: ``boolean``


.. _config.schema.json#/definitions/mcmc_heatmaps_item/properties/burn_in:

burn_in
#######

.. container:: title

 Burn-in start index.

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/mcmc_heatmaps_item/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/mcmc_traj_plots_item:

mcmc_traj_plots_item
++++++++++++++++++++

.. container:: title

 mcmc_traj_plots item

Plots the functional value of each graph in a MCMC trajctory.

:type: ``object``

:additionalItems: ``False``

:Required: :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/id`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/burn_in`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/thinning`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional`

**Properties:** :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/active`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/burn_in`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/id`, :ref:`config.schema.json#/definitions/mcmc_traj_plots_item/properties/thinning`


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/active:

active
######

:type: ``boolean``


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/burn_in:

burn_in
#######

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional:

functional
##########

May satisfy *any* of the following definitions:


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional/anyOf/0:

0
>

:type: ``string``

**Allowed values:** 

- score
- size


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/functional/anyOf/1:

1
>

:type: ``array``

.. container:: sub-title

 Every element of **1**  is:

:type: ``string``

**Allowed values:** 

- score
- size


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/mcmc_traj_plots_item/properties/thinning:

thinning
########

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/natnum:

natnum
++++++

.. container:: title

 natnum type

Positive integer

:type: ``integer``

:minimum: ``1``


.. _config.schema.json#/definitions/nonegintlist:

nonegintlist
++++++++++++

.. container:: title

 nonnegint list

Non-negative integer list

:type: ``array``

.. container:: sub-title

 Every element of **nonegintlist**  is:

:Reference: :ref:`nonnegint#/`


.. _config.schema.json#/definitions/nonnegint:

nonnegint
+++++++++

.. container:: title

 nonnegint type

Non-negative integer, 0,1,2,...

:type: ``integer``

:minimum: ``0``


.. _config.schema.json#/definitions/nonnegnum:

nonnegnum
+++++++++

.. container:: title

 nonnegnum type

Non-negative number

:type: ``number``

:minimum: ``0``


.. _config.schema.json#/definitions/nonnegnumlist:

nonnegnumlist
+++++++++++++

.. container:: title

 nonnegnumlist

List of non-negative numbers

:type: ``array``

.. container:: sub-title

 Every element of **nonnegnumlist**  is:

:Reference: :ref:`nonnegnum#/`


.. _config.schema.json#/definitions/notears:

notears
+++++++

.. container:: title

 notears item

Notears object

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/notears/properties/id`, :ref:`config.schema.json#/definitions/notears/properties/min_rate_of_progress`, :ref:`config.schema.json#/definitions/notears/properties/penalty_growth_rate`, :ref:`config.schema.json#/definitions/notears/properties/optimation_accuracy`, :ref:`config.schema.json#/definitions/notears/properties/loss`, :ref:`config.schema.json#/definitions/notears/properties/loss_grad`

**Properties:** :ref:`config.schema.json#/definitions/notears/properties/id`, :ref:`config.schema.json#/definitions/notears/properties/loss`, :ref:`config.schema.json#/definitions/notears/properties/loss_grad`, :ref:`config.schema.json#/definitions/notears/properties/min_rate_of_progress`, :ref:`config.schema.json#/definitions/notears/properties/optimation_accuracy`, :ref:`config.schema.json#/definitions/notears/properties/penalty_growth_rate`


.. _config.schema.json#/definitions/notears/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/notears/properties/loss:

loss
####

:type: ``string``

**Allowed values:** 

- least_squares_loss
- least_squares_loss_cov


.. _config.schema.json#/definitions/notears/properties/loss_grad:

loss_grad
#########

:type: ``string``

**Allowed values:** 

- least_squares_loss_grad
- least_squares_loss_cov_grad


.. _config.schema.json#/definitions/notears/properties/min_rate_of_progress:

min_rate_of_progress
####################

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/notears/properties/optimation_accuracy:

optimation_accuracy
###################

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/notears/properties/penalty_growth_rate:

penalty_growth_rate
###################

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/notears_dag_sampling:

notears_dag_sampling
++++++++++++++++++++

.. container:: title

 notears_dag_sampling item

Graph sampling method provided by the notears package. 
 Documentation: https://github.com/jmoss20/notears

:Required: :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/id`, :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes`, :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/num_edges`

**Properties:** :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/id`, :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/mean`, :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/num_edges`, :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes`, :ref:`config.schema.json#/definitions/notears_dag_sampling/properties/variance`


.. _config.schema.json#/definitions/notears_dag_sampling/properties/id:

id
##

.. container:: title

 ID

:type: ``string``


.. _config.schema.json#/definitions/notears_dag_sampling/properties/mean:

mean
####

.. container:: title

 Mean

:type: ``number``


.. _config.schema.json#/definitions/notears_dag_sampling/properties/num_edges:

num_edges
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/notears_dag_sampling/properties/num_nodes:

num_nodes
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/notears_dag_sampling/properties/variance:

variance
########

.. container:: title

 Variance

:type: ``number``


.. _config.schema.json#/definitions/notears_parameters_sampling:

notears_parameters_sampling
+++++++++++++++++++++++++++

.. container:: title

 notears_parameters_sampling item

Notears parameter sampling for Gaissian Bayesian networks. This requires that the adjaceny_matrix (graph) is of type notears_dag_sampling

**Properties:** :ref:`config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from`, :ref:`config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to`, :ref:`config.schema.json#/definitions/notears_parameters_sampling/properties/id`


.. _config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_from:

edge_coefficient_range_from
###########################

:Reference: :ref:`nonnegnum#/`


.. _config.schema.json#/definitions/notears_parameters_sampling/properties/edge_coefficient_range_to:

edge_coefficient_range_to
#########################

:Reference: :ref:`nonnegnum#/`


.. _config.schema.json#/definitions/notears_parameters_sampling/properties/id:

id
##

.. container:: title

 ID

:type: ``string``


.. _config.schema.json#/definitions/pcalg_pc:

pcalg_pc
++++++++

.. container:: title

 pcalg_pc item

PC algorithm instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/pcalg_pc/properties/id`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/alpha`

**Properties:** :ref:`config.schema.json#/definitions/pcalg_pc/properties/NAdelete`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/alpha`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/conservative`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/id`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/indepTest`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/majrule`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/mmax`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/numCores`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/skelmethod`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/solveconfl`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/u2pd`, :ref:`config.schema.json#/definitions/pcalg_pc/properties/verbose`


.. _config.schema.json#/definitions/pcalg_pc/properties/NAdelete:

NAdelete
########

:type: ``boolean``


.. _config.schema.json#/definitions/pcalg_pc/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/pcalg_pc/properties/conservative:

conservative
############

:type: ``boolean``


.. _config.schema.json#/definitions/pcalg_pc/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/pcalg_pc/properties/indepTest:

indepTest
#########

:type: ``string``

**Allowed values:** 

- binCItest
- gaussCItest
- dsepTest
- disCItest


.. _config.schema.json#/definitions/pcalg_pc/properties/majrule:

majrule
#######

:type: ``boolean``


.. _config.schema.json#/definitions/pcalg_pc/properties/mmax:

mmax
####

:Reference: :ref:`flexnonnegintstring#/`


.. _config.schema.json#/definitions/pcalg_pc/properties/numCores:

numCores
########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/pcalg_pc/properties/skelmethod:

skelmethod
##########

:type: ``string``

**Allowed values:** 

- stable
- original
- stable.fast


.. _config.schema.json#/definitions/pcalg_pc/properties/solveconfl:

solveconfl
##########

:type: ``boolean``


.. _config.schema.json#/definitions/pcalg_pc/properties/u2pd:

u2pd
####

:type: ``string``

**Allowed values:** 

- relaxed
- rand
- retry


.. _config.schema.json#/definitions/pcalg_pc/properties/verbose:

verbose
#######

:type: ``boolean``


.. _config.schema.json#/definitions/pcalg_randdag:

pcalg_randdag
+++++++++++++

.. container:: title

 pcalg_randdag item

An instance of pcalg randdag. Sampling of a DAG with specified maximum averge number for parents for the nodes.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/pcalg_randdag/properties/id`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/max_parents`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/d`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/n`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/par1`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/par2`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/method`

**Properties:** :ref:`config.schema.json#/definitions/pcalg_randdag/properties/d`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/id`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/max_parents`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/method`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/n`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/par1`, :ref:`config.schema.json#/definitions/pcalg_randdag/properties/par2`


.. _config.schema.json#/definitions/pcalg_randdag/properties/d:

d
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/pcalg_randdag/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/pcalg_randdag/properties/max_parents:

max_parents
###########

:Reference: :ref:`flexnonnegintnull#/`


.. _config.schema.json#/definitions/pcalg_randdag/properties/method:

method
######

:type: ``string``


.. _config.schema.json#/definitions/pcalg_randdag/properties/n:

n
#

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/pcalg_randdag/properties/par1:

par1
####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/pcalg_randdag/properties/par2:

par2
####

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/prob:

prob
++++

.. container:: title

 prob type

Number in the range [0,1].

:type: ``number``

:minimum: ``0``

:maximum: ``1``


.. _config.schema.json#/definitions/problist:

problist
++++++++

.. container:: title

 problist type

Probability list

:type: ``array``

.. container:: sub-title

 Every element of **problist**  is:

:Reference: :ref:`prob#/`


.. _config.schema.json#/definitions/rand_bandmat:

rand_bandmat
++++++++++++

.. container:: title

 rand_bandmat item

A graph with a band structured adjacency matrix with random width.

:Required: :ref:`config.schema.json#/definitions/rand_bandmat/properties/id`, :ref:`config.schema.json#/definitions/rand_bandmat/properties/dim`, :ref:`config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth`

**Properties:** :ref:`config.schema.json#/definitions/rand_bandmat/properties/dim`, :ref:`config.schema.json#/definitions/rand_bandmat/properties/id`, :ref:`config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth`


.. _config.schema.json#/definitions/rand_bandmat/properties/dim:

dim
###

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/rand_bandmat/properties/id:

id
##

.. container:: title

 ID

:type: ``string``


.. _config.schema.json#/definitions/rand_bandmat/properties/max_bandwidth:

max_bandwidth
#############

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/rblip_asobs:

rblip_asobs
+++++++++++

.. container:: title

 rblip_asobs item

Blip object

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/rblip_asobs/properties/id`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/scorermethod`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/solvermethod`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/indeg`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/time`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/allocated`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/scorefunction`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/alpha`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/cores`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/verbose`

**Properties:** :ref:`config.schema.json#/definitions/rblip_asobs/properties/allocated`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/alpha`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/cores`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/id`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/indeg`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/scorefunction`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/scorermethod`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/solvermethod`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/time`, :ref:`config.schema.json#/definitions/rblip_asobs/properties/verbose`


.. _config.schema.json#/definitions/rblip_asobs/properties/allocated:

allocated
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/rblip_asobs/properties/alpha:

alpha
#####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/rblip_asobs/properties/cores:

cores
#####

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/rblip_asobs/properties/id:

id
##

.. container:: title

 Unique identifier

Unique identifier for that can be used as reference in the benchmark_setup.

:type: ``string``


.. _config.schema.json#/definitions/rblip_asobs/properties/indeg:

indeg
#####

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/rblip_asobs/properties/scorefunction:

scorefunction
#############

:type: ``string``


.. _config.schema.json#/definitions/rblip_asobs/properties/scorermethod:

scorermethod
############

:type: ``string``


.. _config.schema.json#/definitions/rblip_asobs/properties/solvermethod:

solvermethod
############

:type: ``string``


.. _config.schema.json#/definitions/rblip_asobs/properties/time:

time
####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/rblip_asobs/properties/verbose:

verbose
#######

:Reference: :ref:`nonnegint#/`


.. _config.schema.json#/definitions/roc:

roc
+++

.. container:: title

 roc item

ROC item

:type: ``object``

**Properties:** :ref:`config.schema.json#/definitions/roc/properties/errorbar`, :ref:`config.schema.json#/definitions/roc/properties/filename_prefix`, :ref:`config.schema.json#/definitions/roc/properties/ids`, :ref:`config.schema.json#/definitions/roc/properties/path`, :ref:`config.schema.json#/definitions/roc/properties/point`, :ref:`config.schema.json#/definitions/roc/properties/text`


.. _config.schema.json#/definitions/roc/properties/errorbar:

errorbar
########

:type: ``boolean``


.. _config.schema.json#/definitions/roc/properties/filename_prefix:

filename_prefix
###############

:type: ``string``


.. _config.schema.json#/definitions/roc/properties/ids:

ids
###

:list: ``string``


.. _config.schema.json#/definitions/roc/properties/path:

path
####

:type: ``boolean``


.. _config.schema.json#/definitions/roc/properties/point:

point
#####

:type: ``boolean``


.. _config.schema.json#/definitions/roc/properties/text:

text
####

:type: ``boolean``


.. _config.schema.json#/definitions/sem_params:

sem_params
++++++++++

.. container:: title

 sem_params item

Parameter setting for sampling SEM params.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/sem_params/properties/min`, :ref:`config.schema.json#/definitions/sem_params/properties/max`, :ref:`config.schema.json#/definitions/sem_params/properties/id`

**Properties:** :ref:`config.schema.json#/definitions/sem_params/properties/id`, :ref:`config.schema.json#/definitions/sem_params/properties/max`, :ref:`config.schema.json#/definitions/sem_params/properties/min`


.. _config.schema.json#/definitions/sem_params/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/sem_params/properties/max:

max
###

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/sem_params/properties/min:

min
###

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/sklearn_glasso:

sklearn_glasso
++++++++++++++

.. container:: title

 sklearn_glasso item

GLasso instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/sklearn_glasso/properties/id`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/mode`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/max_iter`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/alpha`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/tol`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/enet_tol`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/verbose`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/precmat_threshold`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/assume_centered`

**Properties:** :ref:`config.schema.json#/definitions/sklearn_glasso/properties/alpha`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/assume_centered`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/enet_tol`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/id`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/max_iter`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/mode`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/precmat_threshold`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/tol`, :ref:`config.schema.json#/definitions/sklearn_glasso/properties/verbose`


.. _config.schema.json#/definitions/sklearn_glasso/properties/alpha:

alpha
#####

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/sklearn_glasso/properties/assume_centered:

assume_centered
###############

:type: ``boolean``


.. _config.schema.json#/definitions/sklearn_glasso/properties/enet_tol:

enet_tol
########

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/sklearn_glasso/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/sklearn_glasso/properties/max_iter:

max_iter
########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/sklearn_glasso/properties/mode:

mode
####

:type: ``string``

**Allowed values:** 

- cd
- lars


.. _config.schema.json#/definitions/sklearn_glasso/properties/precmat_threshold:

precmat_threshold
#################

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/sklearn_glasso/properties/tol:

tol
###

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/sklearn_glasso/properties/verbose:

verbose
#######

:type: ``boolean``


.. _config.schema.json#/definitions/tetrad_fci:

tetrad_fci
++++++++++

.. container:: title

 tetrad_fci item

FCI instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/tetrad_fci/properties/id`, :ref:`config.schema.json#/definitions/tetrad_fci/properties/test`, :ref:`config.schema.json#/definitions/tetrad_fci/properties/alpha`

**Properties:** :ref:`config.schema.json#/definitions/tetrad_fci/properties/alpha`, :ref:`config.schema.json#/definitions/tetrad_fci/properties/datatype`, :ref:`config.schema.json#/definitions/tetrad_fci/properties/id`, :ref:`config.schema.json#/definitions/tetrad_fci/properties/test`


.. _config.schema.json#/definitions/tetrad_fci/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/tetrad_fci/properties/datatype:

datatype
########

:type: ``string``


.. _config.schema.json#/definitions/tetrad_fci/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/tetrad_fci/properties/test:

test
####

:type: ``string``

**Allowed values:** 

- bdeu-test
- cci-test
- cg-lr-test
- chi-square-test
- d-sep-test
- disc-bic-test
- fisher-z-test
- g-square-test
- kci-test
- prob-test


.. _config.schema.json#/definitions/tetrad_fges:

tetrad_fges
+++++++++++

.. container:: title

 tetrad_fges item

fGES instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/tetrad_fges/properties/id`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/faithfulnessAssumed`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/score`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/datatype`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/samplePrior`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/structurePrior`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/penaltyDiscount`

**Properties:** :ref:`config.schema.json#/definitions/tetrad_fges/properties/datatype`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/faithfulnessAssumed`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/id`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/penaltyDiscount`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/samplePrior`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/score`, :ref:`config.schema.json#/definitions/tetrad_fges/properties/structurePrior`


.. _config.schema.json#/definitions/tetrad_fges/properties/datatype:

datatype
########

:type: ``string``


.. _config.schema.json#/definitions/tetrad_fges/properties/faithfulnessAssumed:

faithfulnessAssumed
###################

:type: ``boolean``


.. _config.schema.json#/definitions/tetrad_fges/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/tetrad_fges/properties/penaltyDiscount:

penaltyDiscount
###############

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/tetrad_fges/properties/samplePrior:

samplePrior
###########

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/tetrad_fges/properties/score:

score
#####

:type: ``string``


.. _config.schema.json#/definitions/tetrad_fges/properties/structurePrior:

structurePrior
##############

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/tetrad_gfci:

tetrad_gfci
+++++++++++

.. container:: title

 tetrad_gfci item

GFCI instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/tetrad_gfci/properties/id`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/test`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/structurePrior`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/penaltyDiscount`

**Properties:** :ref:`config.schema.json#/definitions/tetrad_gfci/properties/alpha`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/datatype`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/id`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/penaltyDiscount`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/samplePrior`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/score`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/structurePrior`, :ref:`config.schema.json#/definitions/tetrad_gfci/properties/test`


.. _config.schema.json#/definitions/tetrad_gfci/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/tetrad_gfci/properties/datatype:

datatype
########

:type: ``string``


.. _config.schema.json#/definitions/tetrad_gfci/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/tetrad_gfci/properties/penaltyDiscount:

penaltyDiscount
###############

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/tetrad_gfci/properties/samplePrior:

samplePrior
###########

:Reference: :ref:`flexnonnegnumnull#/`


.. _config.schema.json#/definitions/tetrad_gfci/properties/score:

score
#####

:type: ``string``

**Allowed values:** 

- bdeu-score
- cci-score
- cg-bic-score
- d-sep-score
- disc-bic-score
- sem-bic


.. _config.schema.json#/definitions/tetrad_gfci/properties/structurePrior:

structurePrior
##############

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/tetrad_gfci/properties/test:

test
####

:type: ``string``

**Allowed values:** 

- bdeu-test
- cci-test
- cg-lr-test
- chi-square-test
- d-sep-test
- disc-bic-test
- fisher-z-test
- g-square-test
- kci-test
- prob-test


.. _config.schema.json#/definitions/tetrad_rfci:

tetrad_rfci
+++++++++++

.. container:: title

 tetrad_rfci item

RFCI instance

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/tetrad_rfci/properties/id`, :ref:`config.schema.json#/definitions/tetrad_rfci/properties/test`

**Properties:** :ref:`config.schema.json#/definitions/tetrad_rfci/properties/alpha`, :ref:`config.schema.json#/definitions/tetrad_rfci/properties/datatype`, :ref:`config.schema.json#/definitions/tetrad_rfci/properties/id`, :ref:`config.schema.json#/definitions/tetrad_rfci/properties/test`


.. _config.schema.json#/definitions/tetrad_rfci/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/tetrad_rfci/properties/datatype:

datatype
########

:type: ``string``


.. _config.schema.json#/definitions/tetrad_rfci/properties/id:

id
##

Unique identifier

:type: ``string``


.. _config.schema.json#/definitions/tetrad_rfci/properties/test:

test
####

:type: ``string``

**Allowed values:** 

- bdeu-test
- cci-test
- cg-lr-test
- chi-square-test
- d-sep-test
- disc-bic-test
- fisher-z-test
- g-square-test
- kci-test
- prob-test


.. _config.schema.json#/definitions/trilearn_cta:

trilearn_cta
++++++++++++

.. container:: title

 trilearn_cta item

Graph sampling method provided by the trilearn package. 
 Documentation: https://github.com/felixleopoldo/trilearn

:Required: :ref:`config.schema.json#/definitions/trilearn_cta/properties/id`, :ref:`config.schema.json#/definitions/trilearn_cta/properties/order`, :ref:`config.schema.json#/definitions/trilearn_cta/properties/alpha`, :ref:`config.schema.json#/definitions/trilearn_cta/properties/beta`

**Properties:** :ref:`config.schema.json#/definitions/trilearn_cta/properties/alpha`, :ref:`config.schema.json#/definitions/trilearn_cta/properties/beta`, :ref:`config.schema.json#/definitions/trilearn_cta/properties/id`, :ref:`config.schema.json#/definitions/trilearn_cta/properties/order`


.. _config.schema.json#/definitions/trilearn_cta/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/trilearn_cta/properties/beta:

beta
####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/trilearn_cta/properties/id:

id
##

.. container:: title

 ID

:type: ``string``


.. _config.schema.json#/definitions/trilearn_cta/properties/order:

order
#####

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/trilearn_g_inv_wishart:

trilearn_g_inv_wishart
++++++++++++++++++++++

.. container:: title

 trilearn_g_inv_wishart item

Parameter setting for a graph inverse-Wishart model

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof`, :ref:`config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id`

**Properties:** :ref:`config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof`, :ref:`config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id`


.. _config.schema.json#/definitions/trilearn_g_inv_wishart/properties/dof:

dof
###

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/trilearn_g_inv_wishart/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/trilearn_hyper-dir:

trilearn_hyper-dir
++++++++++++++++++

.. container:: title

 trilearn_hyper-dir item

Parameter setting for a hyper Dirichlet distribution

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/trilearn_hyper-dir/properties/n_levels`, :ref:`config.schema.json#/definitions/trilearn_hyper-dir/properties/pseudo_obs`, :ref:`config.schema.json#/definitions/trilearn_hyper-dir/properties/id`

**Properties:** :ref:`config.schema.json#/definitions/trilearn_hyper-dir/properties/id`, :ref:`config.schema.json#/definitions/trilearn_hyper-dir/properties/n_levels`, :ref:`config.schema.json#/definitions/trilearn_hyper-dir/properties/pseudo_obs`


.. _config.schema.json#/definitions/trilearn_hyper-dir/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/trilearn_hyper-dir/properties/n_levels:

n_levels
########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/trilearn_hyper-dir/properties/pseudo_obs:

pseudo_obs
##########

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/trilearn_intra-class:

trilearn_intra-class
++++++++++++++++++++

.. container:: title

 trilearn_intra-class item

Parameter setting for a graph intra-class model

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/trilearn_intra-class/properties/rho`, :ref:`config.schema.json#/definitions/trilearn_intra-class/properties/sigma2`, :ref:`config.schema.json#/definitions/trilearn_intra-class/properties/id`

**Properties:** :ref:`config.schema.json#/definitions/trilearn_intra-class/properties/id`, :ref:`config.schema.json#/definitions/trilearn_intra-class/properties/rho`, :ref:`config.schema.json#/definitions/trilearn_intra-class/properties/sigma2`


.. _config.schema.json#/definitions/trilearn_intra-class/properties/id:

id
##

:type: ``string``


.. _config.schema.json#/definitions/trilearn_intra-class/properties/rho:

rho
###

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/trilearn_intra-class/properties/sigma2:

sigma2
######

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/trilearn_pgibbs:

trilearn_pgibbs
+++++++++++++++

.. container:: title

 trilearn_pgibbs item

Parameter setting for trilearn with log-linear decomposable model.

:type: ``object``

:Required: :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/id`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/datatype`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/alpha`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/beta`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/radii`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/N`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/M`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/pseudo_obs`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/mcmc_seed`

**Properties:** :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/alpha`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/beta`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/datatype`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/id`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/mcmc_seed`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/pseudo_obs`, :ref:`config.schema.json#/definitions/trilearn_pgibbs/properties/radii`


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/alpha:

alpha
#####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/beta:

beta
####

:Reference: :ref:`flexprob#/`


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/datatype:

datatype
########

:type: ``string``

**Allowed values:** 

- discrete
- continuous


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/id:

id
##

:type: ``string``

:desciption: ``Algorithm identifier``


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/mcmc_seed:

mcmc_seed
#########

:Reference: :ref:`flexnonnegint#/`


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/pseudo_obs:

pseudo_obs
##########

:Reference: :ref:`flexnonnegnum#/`


.. _config.schema.json#/definitions/trilearn_pgibbs/properties/radii:

radii
#####

:Reference: :ref:`flexnonnegint#/`

**Properties:** :ref:`config.schema.json#/properties/benchmark_setup`, :ref:`config.schema.json#/properties/resources`


.. _config.schema.json#/properties/benchmark_setup:

benchmark_setup
+++++++++++++++

.. container:: title

 benchmark_setup

Defines the actual benchmarking setup, where the resources are references by their corresponding id.

:type: ``object``

:Required: :ref:`config.schema.json#/properties/benchmark_setup/properties/data`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation`

**Properties:** :ref:`config.schema.json#/properties/benchmark_setup/properties/data`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation`


.. _config.schema.json#/properties/benchmark_setup/properties/data:

data
####

.. container:: title

 data

The data setup for the study.

:type: ``array``

.. container:: sub-title

 Every element of **data**  is:

:Reference: :ref:`data_setup_dict#/`


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation:

evaluation
##########

.. container:: title

 evaluation

This section contains the available evaluation methods.

:Required: :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots`

**Properties:** :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots`, :ref:`config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc`


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_plots:

adjmat_plots
>>>>>>>>>>>>

.. container:: title

 adjmat_plots

Plots the adjacency matrices of the estimated graphs.

:type: ``array``

.. container:: sub-title

 Every element of **adjmat_plots**  is:

:type: ``string``


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/adjmat_true_plots:

adjmat_true_plots
>>>>>>>>>>>>>>>>>

.. container:: title

 adjmat_true_plots

Plots the adjacency matrices of the true graphs.

:type: ``boolean``


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_plots:

graph_plots
>>>>>>>>>>>

.. container:: title

 graph_plots

Plots the estimated graphs

:type: ``array``

.. container:: sub-title

 Every element of **graph_plots**  is:

:type: ``string``


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/graph_true_plots:

graph_true_plots
>>>>>>>>>>>>>>>>

.. container:: title

 graph_true_plots

Plots the true graphs.

:type: ``boolean``


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_autocorr_plots:

mcmc_autocorr_plots
>>>>>>>>>>>>>>>>>>>

.. container:: title

 mcmc_autocorr_plots

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

:type: ``array``

:additionalItems: ``False``

.. container:: sub-title

 Every element of **mcmc_autocorr_plots**  is:

:Reference: :ref:`mcmc_autocorr_plots_item#/`


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_heatmaps:

mcmc_heatmaps
>>>>>>>>>>>>>

.. container:: title

 mcmc_heatmaps

Plots mean graph as a heatmap from an MCMC trajectory of graphs.

:type: ``array``

:additionalItems: ``False``

.. container:: sub-title

 Every element of **mcmc_heatmaps**  is:

:Reference: :ref:`mcmc_heatmaps_item#/`


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/mcmc_traj_plots:

mcmc_traj_plots
>>>>>>>>>>>>>>>

.. container:: title

 mcmc_traj_plots

Plots the functional value of each graph in a MCMC trajctory.

:type: ``array``

:additionalItems: ``False``

.. container:: sub-title

 Every element of **mcmc_traj_plots**  is:

:Reference: :ref:`mcmc_traj_plots_item#/`


.. _config.schema.json#/properties/benchmark_setup/properties/evaluation/properties/roc:

roc
>>>

.. container:: title

 roc

ROC plots and other benchmarking statistics.

:Reference: :ref:`roc#/`


.. _config.schema.json#/properties/resources:

resources
+++++++++

.. container:: title

 resources

Montains the available modules for generating graphs, parameters, data and structure learning algorithms.

:Required: :ref:`config.schema.json#/properties/resources/properties/data`, :ref:`config.schema.json#/properties/resources/properties/graph`, :ref:`config.schema.json#/properties/resources/properties/parameters`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms`

**Properties:** :ref:`config.schema.json#/properties/resources/properties/data`, :ref:`config.schema.json#/properties/resources/properties/graph`, :ref:`config.schema.json#/properties/resources/properties/parameters`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms`


.. _config.schema.json#/properties/resources/properties/data:

data
####

.. container:: title

 data

Data sampling setup.

:type: ``object``

**Properties:** :ref:`config.schema.json#/properties/resources/properties/data/properties/iid`


.. _config.schema.json#/properties/resources/properties/data/properties/iid:

iid
>>>

.. container:: title

 List of iid setups.

List of iid setups.

:type: ``array``

.. container:: sub-title

 Every element of **iid**  is:

:Reference: :ref:`iid#/`


.. _config.schema.json#/properties/resources/properties/graph:

graph
#####

.. container:: title

 graph

The available graph sampling algorithms.

:type: ``object``

**Properties:** :ref:`config.schema.json#/properties/resources/properties/graph/properties/bandmat`, :ref:`config.schema.json#/properties/resources/properties/graph/properties/bdgraph_graphsim`, :ref:`config.schema.json#/properties/resources/properties/graph/properties/notears`, :ref:`config.schema.json#/properties/resources/properties/graph/properties/pcalg_randdag`, :ref:`config.schema.json#/properties/resources/properties/graph/properties/rand_bandmat`, :ref:`config.schema.json#/properties/resources/properties/graph/properties/trilearn_cta`


.. _config.schema.json#/properties/resources/properties/graph/properties/bandmat:

bandmat
>>>>>>>

.. container:: title

 bandmat

Generates a graph with band structured adjacency matrix.

:type: ``array``

.. container:: sub-title

 Every element of **bandmat**  is:

:Reference: :ref:`bandmat#/`


.. _config.schema.json#/properties/resources/properties/graph/properties/bdgraph_graphsim:

bdgraph_graphsim
>>>>>>>>>>>>>>>>

.. container:: title

 bdgraph_graphsim

Generates an undirected graph using graph.sim from the R package BDgraph.

:type: ``array``

.. container:: sub-title

 Every element of **bdgraph_graphsim**  is:

:Reference: :ref:`bdgraph_graphsim#/`


.. _config.schema.json#/properties/resources/properties/graph/properties/notears:

notears
>>>>>>>

.. container:: title

 notears

:type: ``array``

.. container:: sub-title

 Every element of **notears**  is:

:Reference: :ref:`notears_dag_sampling#/`


.. _config.schema.json#/properties/resources/properties/graph/properties/pcalg_randdag:

pcalg_randdag
>>>>>>>>>>>>>

.. container:: title

 pcalg_randdag

Sampling graph using randDAG from the pcalg package.

:type: ``array``

.. container:: sub-title

 Every element of **pcalg_randdag**  is:

:Reference: :ref:`pcalg_randdag#/`


.. _config.schema.json#/properties/resources/properties/graph/properties/rand_bandmat:

rand_bandmat
>>>>>>>>>>>>

.. container:: title

 rand_bandmat

Generates a graph with band structured adjacency matrix of varying with.

:type: ``array``

.. container:: sub-title

 Every element of **rand_bandmat**  is:

:Reference: :ref:`rand_bandmat#/`


.. _config.schema.json#/properties/resources/properties/graph/properties/trilearn_cta:

trilearn_cta
>>>>>>>>>>>>

.. container:: title

 trilearn_cta

Sample decomposable graph using the Christmas tree algorithm (CTA) from the trilearn package.

:type: ``array``

.. container:: sub-title

 Every element of **trilearn_cta**  is:

:Reference: :ref:`trilearn_cta#/`


.. _config.schema.json#/properties/resources/properties/parameters:

parameters
##########

.. container:: title

 parameters

The available parameter sampling algorithms

:type: ``object``

**Properties:** :ref:`config.schema.json#/properties/resources/properties/parameters/properties/bdgraph_rgwish`, :ref:`config.schema.json#/properties/resources/properties/parameters/properties/bin_bn`, :ref:`config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling`, :ref:`config.schema.json#/properties/resources/properties/parameters/properties/sem_params`, :ref:`config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart`, :ref:`config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir`, :ref:`config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class`


.. _config.schema.json#/properties/resources/properties/parameters/properties/bdgraph_rgwish:

bdgraph_rgwish
>>>>>>>>>>>>>>

.. container:: title

 bdgraph_rgwish

List of graph inverse-Wishart id's

:type: ``array``

.. container:: sub-title

 Every element of **bdgraph_rgwish**  is:

:Reference: :ref:`bdgraph_rgwish#/`


.. _config.schema.json#/properties/resources/properties/parameters/properties/bin_bn:

bin_bn
>>>>>>

.. container:: title

 bin_bn

List of generateBinayBN objects

:type: ``array``

.. container:: sub-title

 Every element of **bin_bn**  is:

:Reference: :ref:`bin_bn#/`


.. _config.schema.json#/properties/resources/properties/parameters/properties/notears_parameters_sampling:

notears_parameters_sampling
>>>>>>>>>>>>>>>>>>>>>>>>>>>

.. container:: title

 notears_parameters_sampling

List of notears id's

:type: ``array``

.. container:: sub-title

 Every element of **notears_parameters_sampling**  is:

:Reference: :ref:`notears_parameters_sampling#/`


.. _config.schema.json#/properties/resources/properties/parameters/properties/sem_params:

sem_params
>>>>>>>>>>

.. container:: title

 sem_params

List of sem_params id's

:type: ``array``

.. container:: sub-title

 Every element of **sem_params**  is:

:Reference: :ref:`sem_params#/`


.. _config.schema.json#/properties/resources/properties/parameters/properties/trilearn_g_inv_wishart:

trilearn_g_inv_wishart
>>>>>>>>>>>>>>>>>>>>>>

.. container:: title

 trilearn_g_inv_wishart

List of graph inverse-Wishart id's

:type: ``array``

.. container:: sub-title

 Every element of **trilearn_g_inv_wishart**  is:

:Reference: :ref:`trilearn_g_inv_wishart#/`


.. _config.schema.json#/properties/resources/properties/parameters/properties/trilearn_hyper-dir:

trilearn_hyper-dir
>>>>>>>>>>>>>>>>>>

.. container:: title

 trilearn_hyper-dir

List of trilearn_hyper-dir id's

:type: ``array``

.. container:: sub-title

 Every element of **trilearn_hyper-dir**  is:

:Reference: :ref:`trilearn_hyper-dir#/`


.. _config.schema.json#/properties/resources/properties/parameters/properties/trilearn_intra-class:

trilearn_intra-class
>>>>>>>>>>>>>>>>>>>>

.. container:: title

 trilearn_intra-class

List of intra-class id's

:type: ``array``

.. container:: sub-title

 Every element of **trilearn_intra-class**  is:

:Reference: :ref:`trilearn_intra-class#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms:

structure_learning_algorithms
#############################

.. container:: title

 structure_learning_algorithms

The available structure learning algorithms

:type: ``object``

**Properties:** :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_itsearch`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_order_mcmc`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_gs`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_hc`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_interiamb`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_mmhc`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_tabu`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gg99_singlepair`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gobnilp`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gt13_multipair`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/notears`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/pcalg_pc`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/rblip_asobs`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/sklearn_glasso`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fci`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fges`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_gfci`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_rfci`, :ref:`config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/trilearn_pgibbs`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_itsearch:

bidag_itsearch
>>>>>>>>>>>>>>

.. container:: title

 bidag_itsearch

Iterative +1 search objects

:type: ``array``

.. container:: sub-title

 Every element of **bidag_itsearch**  is:

:Reference: :ref:`bidag_itsearch#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bidag_order_mcmc:

bidag_order_mcmc
>>>>>>>>>>>>>>>>

.. container:: title

 bidag_order_mcmc

Order MCMC objects

:type: ``array``

.. container:: sub-title

 Every element of **bidag_order_mcmc**  is:

:Reference: :ref:`bidag_order_mcmc#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_gs:

bnlearn_gs
>>>>>>>>>>

.. container:: title

 bnlearn_gs

GS objects

:type: ``array``

.. container:: sub-title

 Every element of **bnlearn_gs**  is:

:Reference: :ref:`bnlearn_interiamb#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_hc:

bnlearn_hc
>>>>>>>>>>

.. container:: title

 bnlearn_hc

HC objects

:type: ``array``

.. container:: sub-title

 Every element of **bnlearn_hc**  is:

:Reference: :ref:`bnlearn_hc#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_interiamb:

bnlearn_interiamb
>>>>>>>>>>>>>>>>>

.. container:: title

 bnlearn_interiamb

Inter-IAMB objects

:type: ``array``

.. container:: sub-title

 Every element of **bnlearn_interiamb**  is:

:Reference: :ref:`bnlearn_interiamb#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_mmhc:

bnlearn_mmhc
>>>>>>>>>>>>

.. container:: title

 bnlearn_mmhc

MMHC objects

:type: ``array``

.. container:: sub-title

 Every element of **bnlearn_mmhc**  is:

:Reference: :ref:`bnlearn_mmhc#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/bnlearn_tabu:

bnlearn_tabu
>>>>>>>>>>>>

.. container:: title

 bnlearn_tabu

Tabu search objects

:type: ``array``

.. container:: sub-title

 Every element of **bnlearn_tabu**  is:

:Reference: :ref:`bnlearn_tabu#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gg99_singlepair:

gg99_singlepair
>>>>>>>>>>>>>>>

.. container:: title

 gg99_singlepair

Guidici & Green parametrisarion

:type: ``array``

.. container:: sub-title

 Every element of **gg99_singlepair**  is:

:Reference: :ref:`gg99_singlepair#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gobnilp:

gobnilp
>>>>>>>

.. container:: title

 gobnilp

Gobnilp objects

:type: ``array``

.. container:: sub-title

 Every element of **gobnilp**  is:

:Reference: :ref:`gobnilp#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/gt13_multipair:

gt13_multipair
>>>>>>>>>>>>>>

.. container:: title

 gt13_multipair

Green & Thomas objects

:type: ``array``

.. container:: sub-title

 Every element of **gt13_multipair**  is:

:Reference: :ref:`gt13_multipair#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/notears:

notears
>>>>>>>

.. container:: title

 notears

Notears objects

:type: ``array``

.. container:: sub-title

 Every element of **notears**  is:

:Reference: :ref:`notears#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/pcalg_pc:

pcalg_pc
>>>>>>>>

.. container:: title

 pcalg_pc

PC algorithm objects

:type: ``array``

.. container:: sub-title

 Every element of **pcalg_pc**  is:

:Reference: :ref:`pcalg_pc#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/rblip_asobs:

rblip_asobs
>>>>>>>>>>>

.. container:: title

 rblip_asobs

List of blip objects

:type: ``array``

.. container:: sub-title

 Every element of **rblip_asobs**  is:

:Reference: :ref:`rblip#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/sklearn_glasso:

sklearn_glasso
>>>>>>>>>>>>>>

.. container:: title

 sklearn_glasso

GLasso scikit-learn implementation

:type: ``array``

.. container:: sub-title

 Every element of **sklearn_glasso**  is:

:Reference: :ref:`sklearn_glasso#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fci:

tetrad_fci
>>>>>>>>>>

.. container:: title

 tetrad_fci

FCI fast causal inference.

:type: ``array``

.. container:: sub-title

 Every element of **tetrad_fci**  is:

:Reference: :ref:`tetrad_fci#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_fges:

tetrad_fges
>>>>>>>>>>>

.. container:: title

 tetrad_fges

fGES objects

:type: ``array``

.. container:: sub-title

 Every element of **tetrad_fges**  is:

:Reference: :ref:`tetrad_fges#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_gfci:

tetrad_gfci
>>>>>>>>>>>

.. container:: title

 tetrad_gfci

GFCI

:type: ``array``

.. container:: sub-title

 Every element of **tetrad_gfci**  is:

:Reference: :ref:`tetrad_gfci#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/tetrad_rfci:

tetrad_rfci
>>>>>>>>>>>

.. container:: title

 tetrad_rfci

RFCI Really fast causal inference

:type: ``array``

.. container:: sub-title

 Every element of **tetrad_rfci**  is:

:Reference: :ref:`tetrad_rfci#/`


.. _config.schema.json#/properties/resources/properties/structure_learning_algorithms/properties/trilearn_pgibbs:

trilearn_pgibbs
>>>>>>>>>>>>>>>

.. container:: title

 trilearn_pgibbs

List of trilearn objects

:type: ``array``

.. container:: sub-title

 Every element of **trilearn_pgibbs**  is:

:Reference: :ref:`trilearn_pgibbs#/`
