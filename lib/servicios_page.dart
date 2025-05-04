import 'package:flutter/material.dart';

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({super.key});

  @override
  Widget build(BuildContext context) {
    void _handleDoubleTap() {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Doble tap en Servicios')));
    }

    void _handleLongPress() {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Presion larga en Servicios')));
  }

    return GestureDetector(
      onDoubleTap: _handleDoubleTap,
      onLongPress: _handleLongPress,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nuestros Servicios'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: const [
              ServicioItem(
                icon: Icons.school,
                title: 'Asesorías Académicas',
                description:
                    'Apoyo personalizado en diferentes materias para mejorar el rendimiento académico.',
              ),
              SizedBox(height: 20),
              ServicioItem(
                icon: Icons.laptop,
                title: 'Plataforma Virtual',
                description:
                    'Acceso a contenidos, evaluaciones y seguimiento desde cualquier dispositivo.',
              ),
              SizedBox(height: 20),
              ServicioItem(
                icon: Icons.people,
                title: 'Talleres y Charlas',
                description:
                    'Espacios formativos sobre habilidades blandas, tecnología y orientación vocacional.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicioItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServicioItem({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(description, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
