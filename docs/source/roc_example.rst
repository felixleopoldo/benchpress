Simple ROC curve example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This example plots roc curves for some of the available structure learning algorithms is pre-configured in config.sample.json.
The algorithms a ran on fours different types of datasets.
A sample config file is found in :download:`config.sample.json <../../config.sample.json>` 


and run the snakemake taget roc with 2 cores and singularity enabled as

.. code-block:: bash

    $ snakemake roc --cores 2 --use-singularity --configfile config.sample.json

This will produce the plot below

.. image:: _static/ROC.png
   :width: 600