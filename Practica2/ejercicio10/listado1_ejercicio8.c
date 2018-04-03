/*SumaVectoresC.c
 Suma de dos vectores: v3 = v1 + v2

 Para compilar usar(-lrt: real time library):
 gcc -O2 SumaVectoresC.c -o SumaVectores -lrt
 gcc -O2 -S SumaVectores.c -lrt
 Para ejcutar use:SumaVEctoresC longitud
*/
#include <stdlib.h>
#include <stdio.h>
#include <omp.h>

//#define PRINTF_ALL

/*Solo puede estar definida una de las tres constantes VECTOR_(Solo no de los res defines siguientes puede estar
descomentado)*/
//#define VECTOR_LOCAL
#define VECTOR_GLOBAL
//#define VECTOR_DYNAMIC

#ifdef VECTOR_GLOBAL
#define MAX 67108864 //=2^25
double v1[MAX], v2[MAX], v3[MAX];
#endif


int main(int argc, char** argv){
    int i,k,t,j;

    //struct timespec cgt1,cgt2;
    double ncgt,time_ini,time_fin; //para tiempo de ejecución

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

    #pragma omp parallel sections
    {
        #pragma omp section
        {
          for(i=0; i<N/4; i++){

            v1[i] = N*0.1+i*0.1;
            v2[i] = N*0.1-i*0.1; //los valores dependen de N
            //COMPROBACIÓN DE VALOR POR HEBRA
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v1[i],i );
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v2[i],i );
          }

        }

        #pragma omp section
        {
          for(k=N/4; k<N/2; k++){

            v1[k] = N*0.1+k*0.1;
            v2[k] = N*0.1-k*0.1; //los valores dependen de N
            //COMPROBACIÓN DE VALOR POR HEBRA
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v1[k],k );
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v2[k],k );
          }
        }

        #pragma omp section
        {
          for(t=N/2; t<(N*3)/4; t++){
            v1[t] = N*0.1+t*0.1;
            v2[t] = N*0.1-t*0.1; //los valores dependen de N
            //COMPROBACIÓN DE VALOR POR HEBRA
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v1[t],t );
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v2[t],t );
          }
        }

        #pragma omp section
        {
          for(j=(N*3)/4; j<N; j++){
            v1[j] = N*0.1+j*0.1;
            v2[j] = N*0.1-j*0.1; //los valores dependen de N
            //COMPROBACIÓN DE VALOR POR HEBRA
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v1[j],j );
            //printf("thread %d asigna el valor %f en la iteración %d\n",omp_get_thread_num(),v2[j],j );
          }
        }

    } //cierre parallel


    /*
    //PARA COMPROBAR SI SE HAN ASIGANDO CORRECTAMENTE LOS VECTORES
    for(i=0; i<N ; i++){
      printf("v1[%d] valor: %f\n",i,v1[i]);
      printf("v2[%d] valor: %f\n",i,v2[i]);
    }
    */

    time_ini = omp_get_wtime();
    #pragma omp parallel sections
    {
    //Calcular suma de vectores primer cuarto
      #pragma omp section
      {
        for(i=0; i<N/4; i++)
          v3[i] = v1[i] + v2[i];
      }
    //Calcular suma de vectores segundo cuarto
      #pragma omp section
      {
        for(k=N/4; k<N/2; k++)
          v3[k] = v1[k] + v2[k];
      }
    //Calcular suma de vectores tercer cuarto
      #pragma omp section
      {
        for(t=N/2; t<(N*3)/4; t++)
          v3[t] = v1[t] + v2[t];
      }
    //Calcular suma de vectores cuarto cuarto
      #pragma omp section
      {
        for(j=(N*3)/4; j<N; j++)
          v3[j] = v1[j] + v2[j];
      }
    }
    time_fin = omp_get_wtime();

    /*#pragma omp master
    {
      for(i=0 ; i<N; i++)
        printf("v3[%d] vale: %f\n",i,v3[i]);
        printf("v1[%d] primer valor: %f\n",0,v1[0]);
        printf("v1[%d] ultimo valor: %f\n",N-1,v1[N-1]);
        printf("v2[%d] primer valor: %f\n",0,v2[0]);
        printf("v2[%d] ultimo valor: %f\n",N-1,v2[N-1]);
    }*/

    ncgt= time_fin - time_ini;

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
