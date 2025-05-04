import 'package:flutter/material.dart';

class CuadroNotasPage extends StatelessWidget {
  const CuadroNotasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuadro de Notas'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Mis Notas',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              DataTable(
                columns: const [
                  DataColumn(label: Text('Asignatura')),
                  DataColumn(label: Text('Nota')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Matemáticas')),
                    DataCell(Text('4.5')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Lenguaje')),
                    DataCell(Text('4.0')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Ciencias')),
                    DataCell(Text('4.2')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Inglés')),
                    DataCell(Text('4.7')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Historia')),
                    DataCell(Text('3.9')),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
