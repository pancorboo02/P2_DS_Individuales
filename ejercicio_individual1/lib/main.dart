import 'package:ejercicio_individual1/fabrica_operaciones.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio Individual 1',
      theme: ThemeData(         //Estilos obtenidos de chatgpt (le pedí que pusiera estilo usando distintas gamas de color azul)
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
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
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
          ),
          focusedBorder: const UnderlineInputBorder(
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
  final TextEditingController _numeroController = TextEditingController();
  List<double> _numeros = [];
  String _operacionSeleccionada = 'media';
  String _resultado = '';

  void _agregarNumero() {
    final texto = _numeroController.text.trim();
    final numero = double.tryParse(texto);
    if (numero != null) {
      setState(() {
        _numeros.add(numero);
        _numeroController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Introduce un número válido')),
      );
    }
  }

  void _calcular() {
    final operacion =
        FabricaOperaciones.obtenerOperacion(_operacionSeleccionada);

    if (_numeros.isNotEmpty) {
      final resultado = operacion.calcular(_numeros);
      setState(() {
        _resultado = 'Resultado: ${resultado.toString()}';
      });
    } else {
      setState(() {
        _resultado = 'Introduce valores para poder realizar las operaciones';
      });
    }
  }

  Widget _ponerListadoOperaciones() {   //Fuente: https://api.flutter.dev/flutter/material/Radio-class.html?_gl=1*19qy5lr*_ga*MzEyNjA3NzE4LjE3NDQ3MTU1ODk.*_ga_04YGWK0175*MTc0NDcxNTU4OS4xLjEuMTc0NDcxNjMzMC4wLjAuMA..
    return Column(
      children: [
        ListTile(
          title: const Text('Media', style: TextStyle(color: Colors.white)),
          leading: Radio<String>(
            value: 'media',
            groupValue: _operacionSeleccionada,
            activeColor: const Color(0xFF457B9D),
            onChanged: (value) {
              setState(() {
                _operacionSeleccionada = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Mediana', style: TextStyle(color: Colors.white)),
          leading: Radio<String>(
            value: 'mediana',
            groupValue: _operacionSeleccionada,
            activeColor: const Color(0xFF457B9D),
            onChanged: (value) {
              setState(() {
                _operacionSeleccionada = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Moda', style: TextStyle(color: Colors.white)),
          leading: Radio<String>(
            value: 'moda',
            groupValue: _operacionSeleccionada,
            activeColor: const Color(0xFF457B9D),
            onChanged: (value) {
              setState(() {
                _operacionSeleccionada = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Varianza', style: TextStyle(color: Colors.white)),
          leading: Radio<String>(
            value: 'varianza',
            groupValue: _operacionSeleccionada,
            activeColor: const Color(0xFF457B9D),
            onChanged: (value) {
              setState(() {
                _operacionSeleccionada = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Desviación Estándar', style: TextStyle(color: Colors.white)),
          leading: Radio<String>(
            value: 'desviacion',
            groupValue: _operacionSeleccionada,
            activeColor: const Color(0xFF457B9D),
            onChanged: (value) {
              setState(() {
                _operacionSeleccionada = value!;
              });
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: const Color(0xFF1D3557),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Ejercicio Individual 1\nAutor: Antonio Pancorbo Morales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numeroController,
              decoration: const InputDecoration(
                labelText: 'Introduce un número',
              ),
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _agregarNumero(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _agregarNumero,
                  child: const Text('Agregar'),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Números introducidos: ${_numeros.join(' ')}',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escoge la operación que quieras realizar:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white70),
            ),
            _ponerListadoOperaciones(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

