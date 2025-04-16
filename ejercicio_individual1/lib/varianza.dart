import 'operacion_estadistica.dart';

class Varianza implements OperacionEstadistica {
  @override
  double calcular(List<double> numeros) {
    double suma = 0;
    int tam = numeros.length;

    //Calculo la media
    for (int i = 0; i < tam; i++) {
      suma += numeros[i];
    }
    double media = suma / tam;

    //Calculo el total de sumar la diferencia de cada número y la media de los valores
    double sumaDiferenciasCuadrado = 0;
    for (int i = 0; i < tam; i++) {
      double diferencia = numeros[i] - media;
      sumaDiferenciasCuadrado += diferencia * diferencia;
    }

    //Devuelvo la varianza (sumaDifrenciasCuadrado/tam)
    return sumaDiferenciasCuadrado/tam;
  }
}
