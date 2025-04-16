import 'operacion_estadistica.dart';

class Media implements OperacionEstadistica {
  @override
  double calcular(List<double> numeros) {
    double suma = 0;
    int tam = numeros.length;
    for (int i = 0; i < tam; i++) {
      suma += numeros[i];
    }
    return suma/tam;
  }
}
