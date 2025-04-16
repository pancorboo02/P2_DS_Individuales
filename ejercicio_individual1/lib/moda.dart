import 'operacion_estadistica.dart';

class Moda implements OperacionEstadistica {
  @override
  double calcular(List<double> numeros) {
    int tam = numeros.length;
    List<int> frecuencias = [];

    for(int i = 0; i < tam; i++){     //Inicializo los valores de la lista a 0
      frecuencias.add(0);
    }

    //Con dos bucles voy comprobadno cada número con todos los números de la lista
    for (int i = 0; i < tam; i++) {
      int contador = 0;
      for (int j = 0; j < tam; j++) {
        if (numeros[i] == numeros[j]) {
          contador++;
        }
      }
      frecuencias[i] = contador;    //Asigno la cantidad de veces encontradas de ese valor a la lista frecuencias
    }

    //Busco el índice que más veces sale
    int maxNumVeces = frecuencias[0];
    int indiceModa = 0;
    for (int i = 1; i < frecuencias.length; i++) {
      if (frecuencias[i] > maxNumVeces) {
        maxNumVeces = frecuencias[i];
        indiceModa = i;
      }
    }

    return numeros[indiceModa];
  }
}
