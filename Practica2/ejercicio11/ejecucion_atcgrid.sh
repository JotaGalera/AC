#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#PBS -N listado1_ejercicio7
#Se asigna al trabajo la cola ac
#PBS -q ac
#Se imprime información del trabajo usando variables de entorno de PBS
echo "ID. usuario del trabajo: $PBS_O_LOGNAME"
echo "Id. del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE


echo "Ejecucion de listado1_ejercicio7"
for ((N=65536;N<67108865;N=N*2))
do
    time $PBS_O_WORKDIR/listado1_ejercicio7 $N
done
