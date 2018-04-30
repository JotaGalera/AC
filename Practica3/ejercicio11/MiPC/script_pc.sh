#!/bin/bash
export OMP_DYNAMIC=FALSE
export OMP_NUM_THREADS=8

echo 'Ejecucion local de pmv'

for ((i=100;i<20000;i=i*10))
do
    echo '********** Tamanio '+$i+' **********\n'
    echo 'PMV version A'
    ./matriz $i

    echo 'PMV version B'
    ./matriz_b $i

    echo 'PMV version reduction'
    ./matriz_reduc  $i
done
