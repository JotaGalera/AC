#include <stdio.h>
#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num() 0
#endif

int main(int argc, char** argv){
    int i, n=7;
    int a[n],suma=0;

    for(i=0;i<n;i++)
        a[i]=i;

    #pragma omp parallel for firstprivate(suma) lastprivate(suma)
        for(i=0;i<n;i++){
            suma += a[i];
            printf("thread %d suma a[%d] suma=%d\n",omp_get_thread_num(),i,suma);
        }
    printf("\nFuera de 'parallel' suma = %d",suma);

    printf("\n");
    return 0;
}
