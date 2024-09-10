import 'package:flutter/material.dart';

class Reto1Screen extends StatefulWidget {
  const Reto1Screen({Key? key}) : super(key: key);

  @override
  _Reto1ScreenState createState() => _Reto1ScreenState();
}

class _Reto1ScreenState extends State<Reto1Screen> {
  int _counter = 0; // Variable de estado

  void _incrementCounter() {
    setState(() {
      _counter++; // Incrementa el contador
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 1'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Has presionado el botón esta cantidad de veces:',
            ),
            Text(
              '$_counter', // Muestra el valor del contador
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // Llama a _incrementCounter cuando se presiona
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
