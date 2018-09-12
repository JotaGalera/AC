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
    
    if(argc < 2){
        fprintf(stderr, "[ERROR]-Falta tamanio de matriz/vector, o valor para omp_schedule \n");
        exit(-1);
    }

    //Partiremos de que la matriz es una matriz triangular regular, es decir
    //tiene las mismas filas que columnas, y para poder realizar el producto
    //entre la matriz y el vector necesitaremos que el vector tenga el mismo
    //número de "filas"/componentes, como columnas tenga nuestra matriz.
    int i,j,k;
    int n_columnas;
    int **matriz2;
    int **matriz;
    int **resultado;
    
    n_columnas = atoi(argv[1]);


    matriz2 = (int**) malloc(n_columnas*sizeof(int*));
    matriz = (int**) malloc(n_columnas*sizeof(int*));
    resultado = (int**) malloc(n_columnas*sizeof(int*));
    for(i=0; i < n_columnas; i++){
        matriz[i] = (int*) malloc(n_columnas*sizeof(int));
        matriz2[i] = (int*) malloc(n_columnas*sizeof(int));
        resultado[i] = (int*) malloc(n_columnas*sizeof(int));
    }

    //Rellenamos la matriz en función de i<=j para hacer
    //ceros los que están por debajo de la diagonal
    //También se inicializa el vector.
    for(i=0; i < n_columnas ; i++){
        for(j=0; j < n_columnas ; j++){
            matriz[i][j] = i+j+1;
            matriz2[i][j] = i+j+1;
            resultado[i][j] = 0;
        }
    }

    //Imprimimos la matriz:
    printf("Matriz:\n");
    imprimir_Matriz(matriz,n_columnas);
    printf("\n\n");
    //Imprimimos el vector:
    printf("Mztriz 2:\n");
    imprimir_Matriz(matriz2,n_columnas); 
    printf("\n\n");
    //Realizamos la multiplicacion:
    for(i=0 ; i<n_columnas ; i++){
        for(j=0 ; j<n_columnas ; j++){
            for(k=0; k<n_columnas ; k++){
                resultado[i][j] += matriz[i][k]*matriz2[k][j];
            }
        }
    }

    //Visualizamos el resultado
    printf("Resultado:\n");
    imprimir_Matriz(resultado,n_columnas);

    //Liberamos memoria
    for (i=0; i<n_columnas; i++){
        free(matriz[i]);
        free(matriz2[i]);
        free(resultado[i]);
    }
    free(matriz);
    free(matriz2);
    free(resultado);

}