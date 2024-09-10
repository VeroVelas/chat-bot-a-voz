import 'package:flutter/material.dart';

class Reto3Screen extends StatefulWidget {
  const Reto3Screen({Key? key}) : super(key: key);

  @override
  _Reto3ScreenState createState() => _Reto3ScreenState();
}

class _Reto3ScreenState extends State<Reto3Screen> {
  // Controlador para el TextField
  final TextEditingController _controller = TextEditingController();
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 3'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TextField básico
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texto básico',
                hintText: 'Ingresa algo...',
              ),
            ),
            const SizedBox(height: 20),
            // TextField con estilo personalizado
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                labelText: 'Texto con estilo',
                hintText: 'Ingresa algo...',
                prefixIcon: Icon(Icons.text_fields, color: Colors.blue),
              ),
            ),
            const SizedBox(height: 20),
            // TextField con controlador y eventos
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texto con controlador',
                hintText: 'Ingresa algo...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
              onChanged: (text) {
                print('Texto ingresado: $text');
              },
            ),
          ],
        ),
      ),
    );
  }
}
