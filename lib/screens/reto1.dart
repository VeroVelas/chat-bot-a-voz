import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Reto1Screen extends StatelessWidget {
  // Función para abrir el enlace del repositorio en el navegador
  void _launchURL() async {
    final Uri url = Uri.parse('https://github.com/VeroVelas/chat-bot-a-voz.gitt'); // Cambia este URL por el de tu repositorio
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información del Alumno'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Logo en el centro
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.jpg'), // Asegúrate de tener esta imagen en la ruta indicada
                  radius: 80, // Tamaño del logo
                ),
              ),
              const SizedBox(height: 20),

              // Información del alumno
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Verónica Velasco Jiménez',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Matrícula: 221224',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Carrera: Ingeniería en Software',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Materia: Programación Móvil',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Grupo: A',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Botón para abrir el repositorio
              ElevatedButton.icon(
                onPressed: _launchURL,
                icon: const Icon(Icons.link),
                label: const Text('Abrir Repositorio'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Color del botón
                  foregroundColor: Colors.white, // Color del texto y el ícono
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
