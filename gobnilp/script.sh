#!/bin/bash

# creating temporary settings file for gobnilp
SETTINGS_FILE=${snakemake_output[adjmat]}.gobnilp.set
touch $SETTINGS_FILE 
echo -e gobnilp/outputfile/adjacencymatrix = \"${snakemake_output[adjmat]}\" >> $SETTINGS_FILE
echo -e gobnilp/outputfile/scoreandtime = \"${snakemake_output[adjmat]}.scoretime\" >> $SETTINGS_FILE
echo -e gobnilp/dagconstraintsfile = \"${snakemake_input[edgeConstraints_formatted]}\" >> $SETTINGS_FILE
echo -e misc/catchctrlc = FALSE >> $SETTINGS_FILE
echo -e gobnilp/writebestsols = TRUE >> $SETTINGS_FILE
if [ ${snakemake_wildcards[continuous]} = "True" ]; then
    echo -e gobnilp/scoring/continuous = TRUE >> $SETTINGS_FILE
    echo -e gobnilp/scoring/score_type = \"${snakemake_wildcards[score_type]}\" >> $SETTINGS_FILE
    echo -e gobnilp/scoring/alpha_mu = ${snakemake_wildcards[alpha_mu]} >> $SETTINGS_FILE
    echo -e gobnilp/scoring/alpha_omega_minus_nvars = ${snakemake_wildcards[alpha_omega_minus_nvars]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[continuous]} = "False" ]; then
    echo -e gobnilp/scoring/alpha = ${snakemake_wildcards[alpha]} >> $SETTINGS_FILE ;
fi
echo -e gobnilp/scoring/palim = ${snakemake_wildcards[palim]} >> $SETTINGS_FILE
if [ ${snakemake_wildcards[time_limit]} != "None" ]; then
    echo -e limits/time = ${snakemake_wildcards[time_limit]} >> $SETTINGS_FILE ;
fi
if [ ${snakemake_wildcards[gap_limit]} != "None" ]; then
    echo -e limits/gap = ${snakemake_wildcards[gap_limit]} >> $SETTINGS_FILE ;
fi
echo -e gobnilp/scoring/prune = ${snakemake_wildcards[prune]} >> $SETTINGS_FILE
echo -e gobnilp/delimiter = \",\" >> $SETTINGS_FILE
cat ${snakemake_input[edgeConstraints_formatted]}
cat resources/extra_args/${snakemake_wildcards[extra_args]} >> $SETTINGS_FILE
cat $SETTINGS_FILE

# different execution depending on timeout
if [ ${snakemake_wildcards[timeout]} != "None" ]; then                    
    STR="/myappdir/gobnilp/bin/gobnilp -f=dat -g="${snakemake_output[adjmat]}".gobnilp.set "${snakemake_input[data]};
    (timeout --signal=SIGKILL ${snakemake_wildcards[timeout]} bash -c "$STR" || exit 0)
else
    /myappdir/gobnilp/bin/gobnilp -f=dat -g=$SETTINGS_FILE ${snakemake_input[data]};
fi

# saving the results
if [ -f ${snakemake_output[adjmat]} ]; then
    sed --in-place s/\ /,/g ${snakemake_output[adjmat]}
    head -n 1 ${snakemake_input[data]} > ${snakemake_output[adjmat]}.header
    cat ${snakemake_output[adjmat]} >> ${snakemake_output[adjmat]}.header
    awk '{{print $2}}' ${snakemake_output[adjmat]}.scoretime > ${snakemake_output[time]}
    mv ${snakemake_output[adjmat]}.header ${snakemake_output[adjmat]}
    rm -f ${snakemake_output[adjmat]}.scoretime;
else # if the time limit was reached, create emtpy file
    touch ${snakemake_output[adjmat]}
    echo None > ${snakemake_output[time]};
fi
rm -f $SETTINGS_FILE