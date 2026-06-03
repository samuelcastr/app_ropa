import 'package:flutter/material.dart';

class OutfitListScreen extends StatelessWidget {
  const OutfitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Outfits')),
      body: const Center(child: Text('Lista de outfits')),
    );
  }
}
