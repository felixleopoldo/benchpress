#/bin/bash

# Converts an eps to png file
gs -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -r600 -sDEVICE=pngalpha -sOutputFile=$2 $1
