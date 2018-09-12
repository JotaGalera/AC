#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

void imprimir(){
    omp_sched_t kind;
    int modifier;
    printf("\n\tdyn-var: %d\n\tnthreads-var: %d\n\tthread-limit-var: %d\n"
    ,omp_get_dynamic(),omp_get_max_threads(),omp_get_thread_limit());
    omp_get_schedule(&kind, &modifier);
    printf("\trun-sched-var: ");
            switch(kind){
                case omp_sched_static:
                    printf("\tomp_sched_static\n");
                    break;
                case omp_sched_dynamic:
                    printf("\tomp_sched_dynamic\n");
                    break;
                case omp_sched_guided:
                    printf("\tomp_sched_guided\n");
                    break;
                default:
                    printf("\tomp_sched_auto\n");
                    break;
            }
            printf("\t\tChunks: %d\n\n",modifier);
}


int main(int argc, char** argv){
 
    int i, n=200, chunk, a[n], suma=0;
    
    if(argc < 3){
        fprintf(stderr, "\nFalta iteraciones o chunk\n");
        exit(-1);
    }
    n=atoi(argv[1]);
    if(n>200)n=200;
    chunk = atoi(argv[2]);
    
    for(i=0;i<n;i++) a[i]=i;
    
    
    printf("Antes de 'parallel for'");
    imprimir();    
    
    //Modificar parametros dyn-var, nthreads-var y run-sched-var
    int new_dyn, new_n_threads, new_chunks;
    char new_run_sched_var[18];
    omp_sched_t new_sched;
    printf("Introduce nuevo valor de dyn-var (mayor que 0): ");
    scanf("%i", &new_dyn);
    printf("Introduce nuevo valor de nthreads-var(mayor que 0): ");
    scanf("%i", &new_n_threads);
    printf("Introduce nuevo valor de run-sched-var (omp_sched_static, omp_sched_dynamic, omp_sched_guided): ");
    scanf("%s", new_run_sched_var);
    printf("Introduce nuevo valor de chunks para run-sched-var: ");
    scanf("%i", &new_chunks);
    if(strcmp(new_run_sched_var,"omp_sched_static")==0)                    
        new_sched = omp_sched_static;
    else if(strcmp(new_run_sched_var, "omp_sched_dynamic")==0)
        new_sched = omp_sched_dynamic;
    else if(strcmp(new_run_sched_var,"omp_sched_guided")==0)
        new_sched = omp_sched_guided;
    else new_sched = omp_sched_auto;
    omp_set_dynamic(new_dyn);
    omp_set_num_threads(new_n_threads);
    omp_set_schedule(new_sched, new_chunks);
    
    #pragma omp parallel
    {
        #pragma omp for firstprivate(suma) lastprivate(suma) schedule(dynamic, chunk)
        for(i=0; i<n; i++){
            suma = suma + a[i];
            printf("thread %d suma a[%d]=%d suma=%d \n", omp_get_thread_num(),i,a[i],suma);
        }
        if(omp_get_thread_num()==0){
            printf("En la sección 'parallel'");
            imprimir();
        }
    }
     printf("Fuera de 'parallel for' suma=%d\n", suma);
    imprimir();
}