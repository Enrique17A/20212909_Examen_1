#include <stdio.h>
#include <time.h>
#include <stdlib.h>

int analizarDivisores(int num);

int main(){
    //definiendo arreglo
    int arreglo[15];
    int i;
    int suma_div = 0;
    i = 0 ;
    //definiendo semilla
    srand(time(0));
    printf("El arreglo es: ");
    while (i < 15){
        arreglo [i] = rand();

        printf("%i, ", arreglo[i]);
        i ++;
    }
    printf("\n");
    i = 0;
    //llenar arreglo
    while (i < 15){
        
        //analizar divisores propios
        suma_div = analizarDivisores(arreglo [i]);
        //clasificación:
        if(suma_div < arreglo [i]){
            //numero deficiente
            printf("%i - Deficiente \n", arreglo [i]);
        }
        else {
            if (suma_div == arreglo [i]){
                //numero perfecto
                printf("%i - Perfecto \n", arreglo [i]);
            }
            else {
                //numero abundante
                printf("%i - Abundante \n", arreglo [i]);
            }
        }
        i++;
    }

    return 0;
}

int analizarDivisores(int num){
    int suma_div = 0;
    int divisor, residuo;
    int n = 2;  //para no tomar en cuenta el mismo número como divisor
    while(n <= num){
        //hallar divisores propios
        divisor = num / n;
        residuo = num % n;
        //si son divisores:
        if (residuo == 0){
            suma_div = suma_div + divisor;
        } 
        n ++;
    }
    return suma_div;
}
