#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#define VECTOR_GLOBAL
//#define VECTOR_DINAMIC

#ifdef VECTOR_GLOBAL
  #define MAX 1000 //=2^25
  int v1[MAX], v2[MAX], m[MAX][MAX];
#endif


int main(int argc, char* argv[]){
  int i,j;

  struct timespec cgt1,cgt2; // para tiempos de ejecución
  double ncgt;

  //Leer argumento de entrada
  if(argc<2){
    printf("Falta tamanio de matriz\n");
    exit(-1);
  }
  unsigned int N = atoi(argv[1]); // MAXIMO N = 2^32-1


  #ifdef VECTOR_GLOBAL
    if (N>MAX) N=MAX;
  #endif
  #ifdef VECTOR_DINAMIC
    int *v1, *v2, **m;
    v1 = (int *) malloc(N*sizeof(int));
    v2 = (int *) malloc(N*sizeof(int));
    m = (int **) malloc(N*sizeof(int*));
    for(i=0 ; i<N ; i++)
      m[i] = (int *) malloc(N*sizeof(int));

    if( (v1==NULL) || (v2==NULL) || (m==NULL)){
      printf("Error en la reserva de memoria para los vectores o matriz\n", );
      exit(-1);
    }
  #endif

  //Inicialización de vectores
  for(i=0; i<N ; i++){
    v2[i] = i+1;
    printf("[%d]",v2[i]);
  }
  printf("\n");
  for(i=0;i<N;i++){
    printf("\n");
    for(j=0; j<N ; j++){
      m[i][j] = i+j+2;
      if(m[i][j]>=10){
        printf("[%d]",m[i][j]);
      }
      else{
        printf("[0%d]",m[i][j]);
      }
    }
  }

  printf("\n\n");
  clock_gettime(CLOCK_REALTIME,&cgt1);

  //Suma de vectores
  for(i=0; i<N ; i++)
    for(j=0; j<N ; j++)
      v1[i]+=m[i][j]*v2[j];

  clock_gettime(CLOCK_REALTIME,&cgt2);
  ncgt=(double) (cgt2.tv_sec-cgt1.tv_sec)+(double)
          ((cgt2.tv_nsec-cgt1.tv_nsec)/(1.e+9));

  //IMPRIME RESULTADO Y TIEMPO DE EJECUCION
  printf("Tiempo(seg.):%11.9f\t / Tamaño Matriz:%u\t/ \n V1[0]=M[0][0]*V2[0](%d=%d*%d) / / \n V1[%d]=M[%d][%d]*V2[%d](%d=%d*%d) / \n",ncgt,N,v1[0],m[0][0],v2[0],N-1,N-1,N-1,N-1,v1[N-1],m[N-1][N-1],v2[N-1]);

   #ifdef VECTOR_DINAMIC
   free(v1);
   free(v2);
   for(i=0; i<N ; i++)
    free(m[i]);
   free(m);
   #endif
   return 0;
}
