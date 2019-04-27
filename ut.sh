#!/bin/bash

if [ -z "$1" ]
  then
    echo "Extracting all tar.gz files"
    for i in `ls`; do mkdir `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev`; tar -xvf  $i -C `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev` ; done
else
    echo "Extracting the input file " $1
    for i in `echo $1`; do mkdir `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev`; tar -xvf  $i -C `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev` ; done

fi
