import 'operacion_estadistica.dart';

class Mediana implements OperacionEstadistica {
  @override
  double calcular(List<double> numeros) {
    List<double> copia = List.from(numeros);
    copia.sort();             //Ordeno los valores de menor a mayor
    int tam = copia.length;

    int mitad = (tam/2).toInt();  //Tengo que hacer el casting para que mitad sea entero.
    if (tam % 2 == 0) {       //Si el número de valores es par, tengo que coger los 2 del medio y hacerles la media
      return (copia[mitad - 1] + copia[mitad]) / 2;
    } else {                  //Si el número de valores es impar, cojo el valor del medio
      return copia[mitad];
    }
  }
}
