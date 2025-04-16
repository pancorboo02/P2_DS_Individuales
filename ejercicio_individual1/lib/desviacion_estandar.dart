import 'dart:math';
import 'operacion_estadistica.dart';
import 'varianza.dart';

class DesviacionEstandar implements OperacionEstadistica {
  @override
  double calcular(List<double> numeros) {
    return sqrt(Varianza().calcular(numeros));    //la desviacion es la raiz de la varianza
  }
}
