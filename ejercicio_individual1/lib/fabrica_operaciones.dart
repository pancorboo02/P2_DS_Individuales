import 'package:flutter/cupertino.dart';

import 'operacion_estadistica.dart';
import 'media.dart';
import 'mediana.dart';
import 'moda.dart';
import 'varianza.dart';
import 'desviacion_estandar.dart';

class FabricaOperaciones {
  static OperacionEstadistica obtenerOperacion(String tipo) {
    switch (tipo.toLowerCase()) {
      case 'media':
        return Media();
      case 'mediana':
        return Mediana();
      case 'moda':
        return Moda();
      case 'varianza':
        return Varianza();
      case 'desviacion':
        return DesviacionEstandar();
      default:
        throw ErrorDescription('Error');    //Al devolver null necesitaba comprobarlo en el main y poner ? en OperacionEstadista? 
    }                                       //Así qeu pongo error en vez de return null
  }
}
