#!/bin/bash
#PBS -N ejercicio11_atcgrid
#PBS -q ac 
echo "Id. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE
for ((i=100;i<20000;i=i*10))
do
    echo '********** Tamanio '$i' **********\n'
    echo 'PMV version A'
    $PBS_O_WORKDIR/matriz $i

    echo 'PMV version B'
    $PBS_O_WORKDIR/matriz_b $i

    echo 'PMV version reduction'
    $PBS_O_WORKDIR/matriz_reduc  $i
done
