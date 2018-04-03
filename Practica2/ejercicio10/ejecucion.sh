#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#Se ejecuta SumaVectorC, que está en el directorio en el que se ha ejecutado, para N potencia de 2 desde 2^16 a 2^26
#echo "*****************************************************"
#echo "************ Ejecucion de listado1_ejercicio7 ***************"
#echo "*****************************************************"
#for ((N=16384;N<67108865;N=N*2))
#do
#    ./listado1_ejercicio7 $N
#done

#echo "*****************************************************"
#echo "********* Ejecucion de listado1_ejercicio8 ************"
#echo "*****************************************************"

#for ((N=16384;N<67108865;N=N*2))
#do
#    ./listado1_ejercicio8 $N
#done

echo "*****************************************************"
echo "********* Ejecucion de listado1_secuencial *********"
echo "*****************************************************"

for ((N=16384;N<67108865;N=N*2))
do
    ./listado1_secuencial $N
done
