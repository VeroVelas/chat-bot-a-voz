import 'package:flutter/material.dart';
import 'package:flutter_application/screens/reto1.dart';
import 'package:flutter_application/screens/reto2.dart';
import 'package:flutter_application/screens/reto3.dart';  // Importa la pantalla de Reto 3
import 'package:flutter_application/screens/retoFusion.dart';  // Importa la pantalla de Reto Fusion
import 'screens/home.dart';
import 'screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UP Chiapas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const MainScreen(), // Cambiado a MainScreen
        '/reto1': (context) => Reto1Screen(),
        '/reto2': (context) => const Reto2Screen(),
        '/reto3': (context) => const Reto3Screen(),
        '/retoFusion': (context) => const RetoFusionScreen(), // Nueva ruta para Reto Fusion
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [      // Home está en el primer ítem
    Reto1Screen(),            // Reto 1 está en el segundo ítem
    const Reto2Screen(),
    const HomeScreen(),       // Reto 2 está en el tercer ítem
    const Reto3Screen(),      // Reto 3 está en el cuarto ítem
    const RetoFusionScreen(), // Reto Fusion está en el quinto ítem
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UP Chiapas'),
      ),
      body: _screens[_currentIndex], // Pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.blue,  // Color para el ítem seleccionado
        unselectedItemColor: Colors.grey,  // Color para los ítems no seleccionados
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Reto 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Reto 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_rounded),
            label: 'Reto 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),  // Icono para Reto Fusion
            label: 'Reto Fusion',           // Etiqueta para Reto Fusion
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to the Home Page!'),
    );
  }
}
