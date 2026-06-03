import 'package:flutter/material.dart';

class GarmentDetailScreen extends StatelessWidget {
  const GarmentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle de Prenda')),
      body: const Center(child: Text('Detalle')),
    );
  }
}
