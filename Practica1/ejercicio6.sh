#!/bin/bash
#Se asigna al trabajo el nombre SumaVectoresC_vlocales
#Se ejecuta SumaVectorC, que está en el directorio en el que se ha ejecutado, para N potencia de 2 desde 2^16 a 2^26
echo "*****************************************************"
echo "************ Ejecucion de SumaVectorC ***************"
echo "*****************************************************"
for ((N=65536;N<67108865;N=N*2))
do
    ./SumaVectoresLocalC $N
done

#echo "*****************************************************"
#echo "********* Ejecucion de SumaVectorGlobalC ************"
#echo "*****************************************************"

#for ((N=65536;N<67108865;N=N*2))
#do
#    ./SumaVectoresGlobalesC $N
#done

#echo "*****************************************************"
#echo "********* Ejecucion de SumaVectoresDynamicC *********"
#echo "*****************************************************"

#for ((N=65536;N<67108865;N=N*2))
#do
#   ./SumaVectoresDinamicosC $N
#done
