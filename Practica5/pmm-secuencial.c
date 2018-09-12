#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#define MAX 3000

int a[MAX][MAX], b[MAX][MAX], c[MAX][MAX];

void imprimirMatriz(int m[MAX][MAX], int tam){
    int i,j;
    for (i=0; i<tam; i++) {
        for (j=0; j<tam; j++){
                printf("%d ", m[i][j]);
        }
        printf("\n");
    }
    printf("\n");
}

int main(int argc, char const *argv[])
{
    // COMPROBACION DE ARGUMENTOS
    if (argc < 2) {
        fprintf(stderr, "Falta el tamanio de la matriz\n");
        exit(-1);
    }

    int N = atoi(argv[1]);

    if(N>MAX) N = MAX;

    int i, j,k;

    struct timespec cgt1,cgt2; double ncgt;

    //Inicializacion

    for (i=0; i<N; i++) {
        for (j=0; j<N; j++){
            a[i][j] = 0;
            b[i][j] = i+j+1;
            c[i][j] = j+(i+2);
        }
    }
    /*
     * De tamaño 3, por ejmplo:
     * b= 1 2 3
     *    2 3 4
     *    3 4 5
     *
     * c= 2 3 4
     *    3 4 5
     *    4 5 6
     *
     * a= 20 26 32
     *    29 38 47
     *    38 50 62
     *
     */
    printf("c[0][0] = %d, c[N][N] = %d\n",c[0][0],c[N-1][N-1]);

    //imprimirMatriz(b, N);
    //imprimirMatriz(c, N);

    clock_gettime(CLOCK_REALTIME,&cgt1);
    //Calculo
    for (i=0; i<N; i++)
        for (j=0; j<N; j++)
            for (k=0; k<N; k++){
                a[i][j] += b[i][k]*c[k][j];
            }

    clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+( double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    //Solucion
    //imprimirMatriz(a,N);
    printf("\nA[0][0]=%d\nA[N-1][N-1]=%d\n",a[0][0],a[N-1][N-1]);
    printf("\nTiempo (seg.) = %11.9f\n", ncgt);


    return 0;
}
