#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
  #include <omp.h>
#else
  #define omp_get_thread_num()0
#endif


int main(int argc, char ** argv)
{
  int i, n=16,chunk,a[n],suma=0;
  

  if(argc < 2){
    fprintf(stderr, "Falta chunks\n");
    exit(-1);
  }
  if(argc < 3){
    fprintf(stderr, "Falta num_threads\n");
    exit(-1);
  }

  if(n>200)n=200; chunk = atoi(argv[1]); // numero chunks
  int x = atoi(argv[2]); //num threads
  
  for(i=0;i<n;i++) a[i]=i;

  #pragma omp parallel for num_threads(x) firstprivate(suma) \
      lastprivate(suma) schedule(dynamic,chunk)
    for(i=0;i<n;i++){
      suma = suma + a[i];
      printf("thread %d suma a[%d]= %d suma %d\n",
      omp_get_thread_num(),i,a[i],suma);

    }
  #pragma omp parallel
  {
    #pragma omp single
    {
      printf("Fuera de parallel for suma = %d\n",suma );

      int numThreads = omp_get_num_threads();//dyn-var
      int numProcs = omp_get_num_procs();//nthreads-var
      int inParallel = omp_in_parallel();//thread-limit-var
      printf("DENTRO de la region parallel:\n numThreads: %d\n numProcs: %d\ninParallel: %d\n",numThreads,numProcs,inParallel);
      
    }
  }

  printf("FUERA de parallel for suma = %d\n",suma );
  int numThreads = omp_get_num_threads();//dyn-var
  int numProcs = omp_get_num_procs();//nthreads-var
  int inParallel = omp_in_parallel();//thread-limit-var
  printf("FUERA de la region parallel:\n numThreads: %d\n numProcs: %d\ninParallel: %d\n",numThreads,numProcs,inParallel);
      
  
}
