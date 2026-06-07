import 'package:flutter/material.dart';

class OutfitCard extends StatelessWidget {
  final String outfitName;
  final String top;
  final String bottom;
  final String shoes;
  final String date;

  const OutfitCard({
    super.key,
    required this.outfitName,
    required this.top,
    required this.bottom,
    required this.shoes,
    required this.date,
  });

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
            BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Row(
              children: [

                const Icon(
                  Icons.auto_awesome,
                  color: Colors.purple,
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    outfitName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(),

            Text('👚 $top'),
            const SizedBox(height: 4),

            Text('👖 $bottom'),
            const SizedBox(height: 4),

            Text('👟 $shoes'),

            const SizedBox(height: 12),

            Row(
              children: [

                const Icon(
                  Icons.calendar_month,
                  size: 18,
                ),

                const SizedBox(width: 6),

                Text(date),
              ],
            ),
          ],
        ),
      ),
    );
  }
}