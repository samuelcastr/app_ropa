import 'dart:io';

import 'package:flutter/material.dart';

class OutfitVisualCard extends StatelessWidget {
  final String outfitName;
  final String date;

  final String? topImage;
  final String? bottomImage;
  final String? shoesImage;

  final String topName;
  final String bottomName;
  final String shoesName;

  const OutfitVisualCard({
    super.key,
    required this.outfitName,
    required this.date,
    required this.topImage,
    required this.bottomImage,
    required this.shoesImage,
    required this.topName,
    required this.bottomName,
    required this.shoesName,
  });

  Widget buildImage(
    String? path,
  ) {
    if (path == null) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius:
              BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.checkroom,
        ),
      );
    }

    return ClipRRect(
      borderRadius:
          BorderRadius.circular(12),

      child: Image.file(
        File(path),
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),

      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(18),
      ),

      child: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,

              children: [

                buildImage(topImage),

                buildImage(bottomImage),

                buildImage(shoesImage),
              ],
            ),

            const SizedBox(
              height: 16,
            ),

            Text(
              outfitName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Text('👚 $topName'),
            Text('👖 $bottomName'),
            Text('👟 $shoesName'),

            const SizedBox(
              height: 10,
            ),

            Text(
              date,
              style: TextStyle(
                color:
                    Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}