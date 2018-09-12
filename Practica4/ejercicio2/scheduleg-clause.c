#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
    #include <omp.h>
#else
    #define omp_get_thread_num()0
#endif

int main(int argc, char **argv){
    int i,n=20,chunk,a[n],suma=0;
    if(argc < 4){
        fprintf(stderr,"\nFalta iteraciones y/o chunk y/o num_thread\n");
        exit(-1);
    }

    int x= atoi(argv[3]); // numero de threads
    n= atoi(argv[1]); // numero iteraciones 1 param
    if(n>20)n=20;
    chunk=atoi(argv[2]);   // numero de chunks 2 param
    for(i=0; i<n ; i++) a[i] = i;

    #pragma omp parallel for num_threads(x) firstprivate(suma) \
            lastprivate(suma) schedule(guided,chunk)
    for(i = 0; i<n ; i++){
        suma=suma + a[i];
        printf("thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(),
            i,a[i],suma);
    }
    printf("Fuera de parallel for suma = %d\n",suma);
}