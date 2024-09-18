import 'package:flutter/material.dart';
import 'dart:convert';  // Para convertir la respuesta en JSON.
import 'package:http/http.dart' as http;  // Importar el paquete http.

class RetoFusionScreen extends StatefulWidget {
  const RetoFusionScreen({Key? key}) : super(key: key);

  @override
  _RetoFusionScreenState createState() => _RetoFusionScreenState();
}

class _RetoFusionScreenState extends State<RetoFusionScreen> {
  final String apiUrl = 'https://pokeapi.co/api/v2/pokemon';
  
  final TextEditingController _controller = TextEditingController();
  
  Future<Map<String, dynamic>>? _pokemonData;
  String _statusMessage = "";
  bool _isLoading = false;  // Controla el estado del spinner
  
  // Método para buscar un Pokémon
  void _searchPokemon() {
    final pokemonName = _controller.text.toLowerCase();
    if (pokemonName.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _pokemonData = fetchPokemon(pokemonName);
      });
    }
  }

  // Future para manejar la respuesta de la API
  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse('$apiUrl/$name'));

    if (response.statusCode == 200) {
      setState(() {
        _isLoading = false;  // Deja de mostrar el spinner cuando cargue la imagen
      });
      return json.decode(response.body);
    } else {
      setState(() {
        _isLoading = false;
        _statusMessage = "No se encontró el Pokémon '$name'.";
      });
      throw Exception('Error al obtener información de Pokémon para $name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reto Fusion - Buscador Pokémon'),
        backgroundColor: Colors.blue,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Introduce el nombre del Pokémon',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _searchPokemon,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator() // Mostrar spinner mientras se busca el Pokémon
                : FutureBuilder<Map<String, dynamic>>(
                    future: _pokemonData,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();  // Mostrar spinner mientras se carga la imagen
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final data = snapshot.data!;
                        final name = data['name'];
                        final height = data['height'];
                        final weight = data['weight'];
                        final sprite = data['sprites']['front_default'];

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              sprite,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const CircularProgressIndicator();  // Spinner mientras carga la imagen
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
                      return const Text('Sin datos');  // En caso de que no haya datos
                    },
                  ),
            Text(
              _statusMessage,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
