/*
 Producto de Matriz cuadrada por Vector

 Para compilar usar(-lrt: real time library):
 gcc -O2 pmv-secuencial.c -o pmv-secuencial -lrt
 gcc -O2 -S pmv-secuencial.c -lrt
 Para ejcutar use:pmv-secuencial <tamaño matriz>
*/
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <omp.h>

//#define VECTOR_GLOBAL
#define VECTOR_DYNAMIC


#define PRINT_ALL

#ifdef VECTOR_GLOBAL
    #define MAX 100000
    int v1[MAX], v2[MAX], m[MAX][MAX];
#endif


int main(int argc, char** argv){
    int i,j,suma_local;

    struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución

    //Leer argumento de entrada (no de componentes del vector)
    if (argc<2){
        printf("Falta tamanio de la matriz\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=429496729 (sizeof(unsigned int) = 4 B)

    #ifdef VECTOR_GLOBAL
        if (N>MAX) N=MAX;
    #endif
    #ifdef VECTOR_DYNAMIC
        int *v1, *v2, **m;
        v1 = (int*) malloc(N*sizeof(int));// malloc necesita el tamaño en bytes
        v2 = (int*) malloc(N*sizeof(int)); //si no hay espacio suficiente malloc devuelve NULL
        m = (int**)malloc(N*sizeof(int*));
        for(i=0; i<N;i++)
            m[i] = (int*) malloc(N*sizeof(int));

        if ( (v1==NULL) || (v2==NULL) || (m==NULL)){
            printf("Error en la reserva de espacio para los vectores/matriz\n");
            exit(-2);
        }
    #endif

    //Inicializar vectores de forma paralela
    //repartiendo el for en las distintas hebras
    #pragma omp parallel for
    for(i=0; i<N; i++){
        v2[i] = i+1;
    }
    //Inicializar matriz
    //private la "j", puesto que cada hebra se
    //encargará de poner valor a cada columna

    //SE PODRÍA PONER TAMBIÉN LA "i", PERO DE ESTA MANERA CADA COLUMNA TENDRA UN +1
    //EN CADA POSICION HACIA LA DERECHA
    #pragma omp parallel for private(j)
    for(i=0;i<N;i++){
        for(j=0;j<N;j++){
            m[i][j] = i+j+2;
            //printf("Para la hebra:%d , el valor de j es:%d\n",omp_get_thread_num(),j );
        }
    }

    #ifdef PRINT_ALL
        //Mostra vector
        for(i=0;i<N;i++)
            printf("[%d]",v2[i]);
        printf("\n");
        //Mostrar matriz
        for(i=0;i<N;i++){
            printf("\n");
            for(j=0;j<N;j++){
                if(m[i][j]>=10){
                    printf("[%d]",m[i][j]);
                }
                else {
                    printf("[0%d]",m[i][j]);
                }
            }
        }
        printf("\n\n");
    #endif
    clock_gettime(CLOCK_REALTIME,&cgt1);

    //Calcular suma de vectores
    //Valor suma_local como private inicializada a 0
    //dentro, la idea es almacenar en cada posicion de v1
    //el valor de cada hebra para realizar una suma total después
    #pragma omp parallel for private(suma_local)
    for(i=0; i<N; i++){
        suma_local = 0;
        for(j=0;j<N;j++)
            suma_local+=m[i][j];
        v1[i]=suma_local*v2[i];
    }


    clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));



    //Imprimir resultado de la suma y el tiempo de ejecución
    printf("Tiempo(seg.):%11.9f\t v1[0]=%d\t v1[%d]=%d\n", ncgt, v1[0],N-1,v1[N-1]);
    //printf("Tiempo(seg.):%11.9f\t / Tamaño Matriz:%u\t/ \n V1[0]=M[0][0]*V2[0](%d=%d*%d) / / \n V1[%d]=M[%d][%d]*V2[%d](%d=%d*%d) / \n", ncgt,N,v1[0],m[0][0],v2[0],N-1,N-1,N-1,N-1,v1[N-1],m[N-1][N-1],v2[N-1]);

    #ifdef PRINT_ALL
    for(i=0;i<N;i++)printf("v1[%d]=%d\n",i,v1[i]);
    #endif


    #ifdef VECTOR_DYNAMIC
    free(v1); // libera el espacio reservado para v1
    free(v2); // libera el espacio reservado para v2
    for(i=0;i<N;i++)
        free(m[i]);
    free(m);
    #endif
    return 0;
}
