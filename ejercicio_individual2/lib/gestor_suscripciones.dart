class GestorSuscripciones {
  final List<Suscripcion> _listaSuscripciones = [];

  List<Suscripcion> obtenerSuscripciones() {
  return _listaSuscripciones;
}

  void aniadirSuscripcion(Suscripcion suscripcion) {
    _listaSuscripciones.add(suscripcion);
  }

  void eliminarSuscripcion(Suscripcion suscripcion) {
    _listaSuscripciones.remove(suscripcion);
  }

  double getSumaTotal() {
    double suma = 0.0;
    for (int i = 0; i < _listaSuscripciones.length; i++) {
      suma = suma + _listaSuscripciones[i].precioMensual;
    }
    return suma;
  }
}

class Suscripcion {
  String descripcion;
  double precioMensual;

  Suscripcion(this.descripcion, this.precioMensual);
}
