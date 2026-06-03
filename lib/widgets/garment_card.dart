import 'package:flutter/material.dart';

class GarmentCard extends StatelessWidget {
  final String title;

  const GarmentCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(leading: const Icon(Icons.checkroom), title: Text(title)),
    );
  }
}
