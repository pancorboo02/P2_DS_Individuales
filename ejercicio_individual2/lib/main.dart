// main.dart

import 'package:flutter/material.dart';
import 'gestor_suscripciones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Suscripciones',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),   //Estilos obtenidos de chatgpt al pedir que ponga gamas de color azul
        primaryColor: const Color(0xFF1D3557),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF457B9D),
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF457B9D),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.white70),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF457B9D)),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GestorSuscripciones _gestorSuscripciones = GestorSuscripciones();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  void _aniadirSuscripcion() {
    final descripcion = _descripcionController.text;
    final precio = double.tryParse(_precioController.text);

    if (descripcion.isNotEmpty && precio != null) {
      setState(() {
        _gestorSuscripciones.aniadirSuscripcion(Suscripcion(descripcion, precio));
      });
    }
  }

  void _eliminarSuscripcion(Suscripcion suscripcion) {
    setState(() {
      _gestorSuscripciones.eliminarSuscripcion(suscripcion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Suscripciones'),
        backgroundColor: const Color(0xFF1D3557),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Ejercicio Individual 2\nAutor: Antonio Pancorbo Morales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _descripcionController,
              decoration: const InputDecoration(
                labelText: 'Nombre de la suscripcion',
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _precioController,
              decoration: const InputDecoration(
                labelText: 'Precio mensual en € de la suscripción',
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _aniadirSuscripcion(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _aniadirSuscripcion,
              child: const Text('Añadir Suscripción'),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _gestorSuscripciones.obtenerSuscripciones().length,
              itemBuilder: (context, index) {
                final suscripcion = _gestorSuscripciones.obtenerSuscripciones()[index];
                return Card(      //Aquí se construye cada suscripción añadida, con su nombre, precio y opción de borrar
                  color: const Color(0xFF1D3557),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      suscripcion.descripcion,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${suscripcion.precioMensual.toString()} € al mes',
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.close, color: Colors.redAccent),
                      onPressed: () => _eliminarSuscripcion(suscripcion),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Total mensual: ${_gestorSuscripciones.getSumaTotal().toString()}€',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
