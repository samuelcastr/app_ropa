import 'package:flutter/material.dart';

class ImageSelector extends StatelessWidget {
  const ImageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(border: Border.all()),
      child: const Icon(Icons.add_a_photo, size: 40),
    );
  }
}
