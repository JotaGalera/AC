#include <stdio.h>
#include <stdlib.h>
#ifdef _OPENMP
#include <omp.h>
#else
#define omp_get_thread_num() 0
#endif

void imprimir_Matriz(int ** m,int colum){
    int i,j;
    for(int i=0; i < colum ; i++){
        for(int j=0; j<colum; j++){
            printf("%d ",m[i][j]);
        }
        printf("\n");
    }
}

void imprimir_Vector(int * v,int colum){
    int i,j;
    for(int i=0; i < colum ; i++){
            printf("%d ",v[i]);
    }
    printf("\n");
}
int main(int argc, char **argv){
    
    if(argc < 3){
        fprintf(stderr, "[ERROR]-Falta tamanio de matriz/vector, o valor para omp_schedule \n");
        exit(-1);
    }

    //Partiremos de que la matriz es una matriz triangular regular, es decir
    //tiene las mismas filas que columnas, y para poder realizar el producto
    //entre la matriz y el vector necesitaremos que el vector tenga el mismo
    //número de "filas"/componentes, como columnas tenga nuestra matriz.
    int i,j;
    int n_columnas;
    int *vector;
    int **matriz;
    int *resultado;
    omp_sched_t kind;
    int modifier;

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

    n_columnas = atoi(argv[1]);


    vector = (int*) malloc(n_columnas*sizeof(int));
    matriz = (int**) malloc(n_columnas*sizeof(int*));
    resultado = (int*) malloc(n_columnas*sizeof(int));
    for(i=0; i < n_columnas; i++){
        matriz[i] = (int*) malloc(n_columnas*sizeof(int));
    }

    //Rellenamos la matriz en función de i<=j para hacer
    //ceros los que están por debajo de la diagonal
    //También se inicializa el vector.
    for(i=0; i < n_columnas ; i++){
        for(j=0; j < n_columnas ; j++){
            if(i<=j)
                matriz[i][j] = i+j+1;
            else
                matriz[i][j] = 0;
        }
        vector[i] = i+1;
        resultado[i] = 0;
    }

    //Imprimimos la matriz:
    printf("Matriz:\n");
    imprimir_Matriz(matriz,n_columnas);
    printf("\n\n");
    //Imprimimos el vector:
    printf("Vector:\n");
    imprimir_Vector(vector,n_columnas); 
    printf("\n\n");
    //Realizamos la multiplicacion:
    for(i=0 ; i<n_columnas ; i++){
        for(j=0 ; j<n_columnas ; j++){
            resultado[i] += matriz[i][j]*vector[j];
        }
    }

    //Visualizamos el resultado
    printf("Resultado:\n");
    imprimir_Vector(resultado,n_columnas);

    //Liberamos memoria
    for (i=0; i<n_columnas; i++){
        free(matriz[i]);
    }
    free(matriz);
    free(vector);
    free(resultado);

}