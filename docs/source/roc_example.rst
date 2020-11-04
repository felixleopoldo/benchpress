Simple example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This example is based on the config file is found in :download:`config.sample.json <../../config.sample.json>` 
This example plots roc curve for some of the available structure learning algorithms.

Run the snakemake rule roc with 2 cores by:

.. code-block:: bash

    $ snakemake roc --cores 2 --use-singularity --configfile config.sample.json

This will produce the plot below

.. image:: _static/ROC.png
   :width: 400