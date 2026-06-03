import 'package:flutter/material.dart';

class OutfitDetailScreen extends StatelessWidget {
  const OutfitDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle Outfit')),
      body: const Center(child: Text('Detalle del outfit')),
    );
  }
}
