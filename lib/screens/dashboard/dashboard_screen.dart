import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/garment_provider.dart';
import '../../providers/outfit_provider.dart';
import '../../services/dashboard_service.dart';

class DashboardScreen
    extends StatelessWidget {

  const DashboardScreen({
    super.key,
  });

  @override
  Widget build(
      BuildContext context) {

    final garments =
        context
            .watch<
                GarmentProvider>()
            .garments;

    final outfits =
        context
            .watch<
                OutfitProvider>()
            .outfits;

    final stats =
        DashboardService()
            .generateStats(
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
        padding:
            const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,

          children: [

            _StatCard(
              title:
                  'Prendas',
              value:
                  '${stats.totalGarments}',
              icon:
                  Icons.checkroom,
            ),

            _StatCard(
              title:
                  'Favoritas',
              value:
                  '${stats.favoriteGarments}',
              icon:
                  Icons.favorite,
            ),

            _StatCard(
              title:
                  'Outfits',
              value:
                  '${stats.totalOutfits}',
              icon:
                  Icons.auto_awesome,
            ),

            _StatCard(
              title:
                  'Categoría Top',
              value:
                  stats
                      .mostUsedCategory,
              icon:
                  Icons.category,
            ),

            _StatCard(
              title:
                  'Color Top',
              value:
                  stats
                      .mostUsedColor,
              icon:
                  Icons.palette,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard
    extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(
      BuildContext context) {

    return Card(
      elevation: 4,

      child: Padding(
        padding:
            const EdgeInsets.all(16),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment
                  .center,

          children: [

            Icon(
              icon,
              size: 40,
            ),

            const SizedBox(
              height: 12,
            ),

            Text(
              value,
              textAlign:
                  TextAlign.center,
              style:
                  const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            Text(
              title,
              textAlign:
                  TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}