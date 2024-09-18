import 'package:flutter/material.dart';
import 'dart:convert';  // Para convertir la respuesta en JSON.
import 'package:http/http.dart' as http;  // Importar el paquete http.
import 'dart:async';  // Para usar Timer.

class Reto3Screen extends StatefulWidget {
  const Reto3Screen({Key? key}) : super(key: key);

  @override
  _Reto3ScreenState createState() => _Reto3ScreenState();
}

class _Reto3ScreenState extends State<Reto3Screen> {
  // URL base para obtener la información de un Pokémon
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon';

  // Lista de nombres de Pokémon que cambiarán cada 5 segundos
  final List<String> pokemonNames = ['pikachu', 'bulbasaur', 'charmander', 'squirtle'];

  // Variable para controlar el índice actual del Pokémon
  int currentPokemonIndex = 0;

  // Future para almacenar los datos del Pokémon
  Future<Map<String, dynamic>>? _pokemonData;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Obtener la información del primer Pokémon al iniciar la pantalla
    _loadPokemon();

    // Configurar el temporizador para cambiar de imagen cada 5 segundos
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      setState(() {
        currentPokemonIndex = (currentPokemonIndex + 1) % pokemonNames.length;
        _loadPokemon();
      });
    });
  }

  // Método para obtener los datos de un Pokémon
  void _loadPokemon() {
    setState(() {
      _pokemonData = fetchPokemon(pokemonNames[currentPokemonIndex]);
    });
  }

  // Future para manejar la respuesta de la API
  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('$apiUrl/$name'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener información de Pokémon para $name');
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancelar el Timer cuando la pantalla se elimina
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto 3 - API Pokémon'),
        backgroundColor: Colors.blue,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _pokemonData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();  // Mostrar spinner mientras se obtiene la información
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');  // Mostrar el error si ocurre
            } else if (snapshot.hasData) {
              // Si la API devuelve datos
              final data = snapshot.data!;
              final name = data['name'];
              final height = data['height'];
              final weight = data['weight'];
              final sprite = data['sprites']['front_default'];  // Imagen del Pokémon

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    sprite,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();  // Mostrar spinner mientras la imagen carga
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nombre: $name',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Altura: $height decímetros',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Peso: $weight hectogramos',
                    style: const TextStyle(fontSize: 18),
                  ),
                ], 
              );
            }
            return const Text('Sin datos');  // Si no hay datos
          },
        ),
      ),
    );
  }
}
