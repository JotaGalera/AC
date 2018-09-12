#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char** argv)
{
    int i, N,a;
    int *x, *y;
    struct timespec cgt1,cgt2; double ncgt;

    if(argc<3){  fprintf(stderr,"Error en argumentos> ./daxpy [tamanio vector]  [constante]\n"); exit(-1);}

    N = atoi(argv[1]);

    y = (int*) malloc(N*sizeof(int));
    x = (int*) malloc(N*sizeof(int));

    a = atoi(argv[2]);

    for(i=0; i<N;i++){ x[i] = i; y[i] = i*2;}

    clock_gettime(CLOCK_REALTIME,&cgt1);

    for(i = 0; i < N;i++){
        y[i] = a*x[i]+y[i];
    }

    clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    printf("\nTiempo (seg.) = %11.9f\n", ncgt);
    printf("y[0] = %i, y[%d] = %i\n", y[0],N-1, y[N-1]);

    return 0;
}
