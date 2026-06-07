import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/garment_provider.dart';
import '../../providers/outfit_provider.dart';
import '../../services/dashboard_service.dart';
import '../garments/garment_list_screen.dart';
import '../outfits/outfit_generator_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final garments =
        context.watch<GarmentProvider>().garments;

    final outfits =
        context.watch<OutfitProvider>().outfits;

    final stats =
        DashboardService().generateStats(
      garments: garments,
      outfits: outfits,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Closet AI',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: _StatCard(
                    title: 'Prendas',
                    value:
                        '${stats.totalGarments}',
                    icon:
                        Icons.checkroom,
                  ),
                ),

                const SizedBox(
                  width: 12,
                ),

                Expanded(
                  child: _StatCard(
                    title: 'Favoritas',
                    value:
                        '${stats.favoriteGarments}',
                    icon:
                        Icons.favorite,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              children: [

                Expanded(
                  child: _StatCard(
                    title: 'Outfits',
                    value:
                        '${stats.totalOutfits}',
                    icon: Icons.auto_awesome,
                  ),
                ),

                const SizedBox(
                  width: 12,
                ),

                Expanded(
                  child: _StatCard(
                    title: 'Color Top',
                    value:
                        stats.mostUsedColor,
                    icon: Icons.palette,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 24,
            ),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.checkroom,
                ),

                label: const Text(
                  'Mis Prendas',
                ),

                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const GarmentListScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.auto_awesome,
                ),

                label: const Text(
                  'Generar Outfit',
                ),

                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const OutfitGeneratorScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      child: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          children: [

            Icon(
              icon,
              size: 40,
            ),

            const SizedBox(
              height: 10,
            ),

            Text(
              value,
              style:
                  const TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            Text(title),
          ],
        ),
      ),
    );
  }
}