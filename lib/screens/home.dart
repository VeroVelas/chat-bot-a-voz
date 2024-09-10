import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú de Retos'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú de retos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.widgets), // Icono para representar widgets
              title: const Text('Reto 1'),
              onTap: () {
                Navigator.pushNamed(context, '/reto1');
              },
            ),
            ListTile(
              leading: const Icon(Icons.touch_app), // Icono para representar estilos
              title: const Text('Reto 2'),
              onTap: () {
                Navigator.pushNamed(context, '/reto2');
              },
            ),
            ListTile(
              leading: const Icon(Icons.text_fields), // Icono para representar campos de texto
              title: const Text('Reto 3'),
              onTap: () {
                Navigator.pushNamed(context, '/reto3');
              },
            ),

          ],
        ),
      ),

      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0), // Dejar espacio para el AppBar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Bienvenida
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Text(
                      'Bienvenido a UP Chiapas',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0, // Reduce el espacio entre el botón y la barra
        color: Colors.white, // Color blanco para que contraste mejor
        elevation: 10, // Más elevación para mayor sombra
        child: Container(
          height: 60.0, // Ajusta el tamaño de la barra inferior
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.black),
                onPressed: () {
                     Navigator.pushNamed(context, '/home'); // Redirige a HomeScreen
                },
              ),
              const SizedBox(width: 30), // Espacio para el botón flotante
              IconButton(
                icon: const Icon(Icons.person, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
