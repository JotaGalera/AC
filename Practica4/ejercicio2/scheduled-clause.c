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

    }
  }

  printf("Fuera de parallel for suma = %d\n",suma );

  bool din_var = omp_get_dynamic();//dyn-var
  int num_threads = omp_get_max_threads();//nthreads-var
  int thread-limit-var = omp_get_thread_limit();//thread-limit-var
  printf("Fuera de la region parallel:\n dyn-var: %d\n nthreads-var: %d\n
          thread-limit-var: %d\n",din_var,num_threads,thread-limit-var)
  omp_sched_t kind;
  int modifier;
  omp_get_schedile(&kind,&modifier);
  printf("\n run-sched-var: ");
  switch(kind){
    case omp_sched_static:
      printf("\t omp_sched_static\n");
      break;
    case omp_sched_dynamic:
      printf("\t omp_sched_dynamic\n");
      break;
    case omp_sched_guided:
      printf("\t omp_sched_guided\n");
      break;
    default:
      printf("\t omp_sched_auto\n");
      break;
  }
  printf("\t\t Chunks: %d\n\n",modifier)
}
