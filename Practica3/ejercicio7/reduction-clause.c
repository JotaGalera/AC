#include <stdlib.h>
#include <stdio.h>
#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

int main(int argc, char** argv){
    int i, n=20;
    int a[n],suma=10;
    int suma_privada=0;

    if(argc <2){
        fprintf(stderr, "Faltan iteraciones\n");
        exit(-1);
    }

    n= atoi(argv[1]);
    if(n>20)
      n=20;

    for(i=0;i<n;i++)
        a[i]=i;

    #pragma omp parallel firstprivate(suma_privada)
    {
        #pragma omp for
        for(i=0;i<n;i++){
            suma += a[i];
            printf("\n Valor de a[%d]: %d",i,a[i]);
        }
        #pragma omp critical
            suma+=suma_privada;
    }


    printf("\nFuera de 'parallel' suma = %d",suma);

    printf("\n");
    return 0;
}
