#!/bin/bash
for i in `ls`; do mkdir `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev`; tar -xvf  $i -C `echo $i | rev | cut -d'.' -f3,4,5,6,7 | rev` ; done
