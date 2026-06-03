import 'package:flutter/material.dart';

class OutfitCard extends StatelessWidget {
  final String title;

  const OutfitCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(leading: const Icon(Icons.style), title: Text(title)),
    );
  }
}
