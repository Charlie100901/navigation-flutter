import 'package:flutter/material.dart';

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({super.key});

  void _handleTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tap en Nosotros')),
    );
  }

  void _handleLongPress(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Presión larga en Nosotros')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context), 
      onLongPress: () => _handleLongPress(context), 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sobre Nosotros'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                '¿Quiénes somos?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Somos un equipo comprometido con ofrecer soluciones educativas digitales. '
                'Nuestra aplicación fue creada para facilitar el acceso a la información académica '
                'de forma rápida, intuitiva y segura.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),
              const Text(
                'Nuestra misión',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Brindar herramientas tecnológicas que fortalezcan el aprendizaje y la gestión '
                'académica de estudiantes y docentes.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
