/*SumaVectoresC.c
 Suma de dos vectores: v3 = v1 + v2

 Para compilar usar(-lrt: real time library):
 gcc -O2 SumaVectoresC.c -o SumaVectores -lrt
 gcc -O2 -S SumaVectores.c -lrt
 Para ejcutar use:SumaVEctoresC longitud
*/
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

//#define PRINTF_ALL

/*Solo puede estar definida una de las tres constantes VECTOR_(Solo no de los res defines siguientes puede estar
descomentado)*/
//#define VECTOR_LOCAL
#define VECTOR_GLOBAL
//#define VECTOR_DYNAMIC

#ifdef VECTOR_GLOBAL
#define MAX 33554432 //=2^25
double v1[MAX], v2[MAX], v3[MAX];
#endif


int main(int argc, char** argv){
    int i;

    struct timespec cgt1,cgt2; double ncgt; //para tiempo de ejecución

    //Leer argumento de entrada (no de componentes del vector)
    if (argc<2){
        printf("Faltan no componentes del vector\n");
        exit(-1);
    }

    unsigned int N = atoi(argv[1]); // Máximo N =2^32-1=429496729 (sizeof(unsigned int) = 4 B)
    #ifdef VECTOR_LOCAL
    double v1[N], v2[N], v3[N];
    // Tamaño variable local en tiempo de ejecución ...
    // disponible en C a partir de actualización C99
    #endif

    #ifdef VECTOR_GLOBAL
    if (N>MAX) N=MAX;
    #endif
    #ifdef VECTOR_DYNAMIC
    double *v1, *v2, *v3;
    v1 = (double*) malloc(N*sizeof(double));// malloc necesita el tamaño en bytes
    v2 = (double*) malloc(N*sizeof(double)); //si no hay espacio suficiente malloc devuelve NULL
    v3 = (double*) malloc(N*sizeof(double));
    if ( (v1==NULL) || (v2==NULL) || (v3==NULL) ){
        printf("Error en la reserva de espacio para los vectores\n");
        exit(-2);
    }
    #endif

    //Inicializar vectores
    for(i=0; i<N; i++){
        v1[i] = N*0.1+i*0.1;
        v2[i] = N*0.1-i*0.1; //los valores dependen de N
    }
    clock_gettime(CLOCK_REALTIME,&cgt1);
    //Calcular suma de vectores
    for(i=0; i<N; i++)
        v3[i] = v1[i] + v2[i];

    clock_gettime(CLOCK_REALTIME,&cgt2);
    ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double) ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

    //Imprimir resultado de la suma y el tiempo de ejecución
    #ifdef PRINTF_ALL
    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u \n",ncgt,N);
    for(i=0; i<N; i++)
        printf("/ V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) / \n",i,i,i,v1[i],v2[i],v3[i]);
    #else

    printf("Tiempo(seg.):%11.9f\t / Tamaño Vectores:%u\t/ \n V1[0]+V2[0]=V3[0](%8.6f+%8.6f=%8.6f) / / \n V1[%d]+V2[%d]=V3[%d](%8.6f+%8.6f=%8.6f) / \n", ncgt,N,v1[0],v2[0],v3[0],N-1,N-1,N-1,v1[N-1],v2[N-1],v3[N-1]);
    #endif

    #ifdef VECTOR_DYNAMIC
    free(v1); // libera el espacio reservado para v1
    free(v2); // libera el espacio reservado para v2
    free(v3); // libera el espacio reservado para v3
    #endif
    return 0;
}
