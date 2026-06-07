import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/garment.dart';
import '../../providers/outfit_provider.dart';
import '../../providers/garment_provider.dart';
import '../../widgets/outfit_visual_card.dart';

class SavedOutfitsScreen extends StatefulWidget {
  const SavedOutfitsScreen({super.key});

  @override
  State<SavedOutfitsScreen> createState() =>
      _SavedOutfitsScreenState();
}

class _SavedOutfitsScreenState
    extends State<SavedOutfitsScreen> {

  Garment? garmentById(
    int? id,
    List<Garment> garments,
  ) {
    if (id == null) {
      return null;
    }

    try {
      return garments.firstWhere(
        (g) => g.id == id,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<OutfitProvider>()
          .loadOutfits();
    });
  }

  @override
  Widget build(BuildContext context) {
    final outfitProvider =
        context.watch<OutfitProvider>();

    final garments =
        context.watch<GarmentProvider>().garments;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Outfits Guardados',
        ),
      ),

      body: outfitProvider.outfits.isEmpty
          ? const Center(
              child: Text(
                'No hay outfits guardados',
              ),
            )
          : ListView.builder(
              itemCount:
                  outfitProvider.outfits.length,

              itemBuilder:
                  (context, index) {

                final outfit =
                    outfitProvider
                        .outfits[index];

                final top =
                    garmentById(
                  outfit.topId,
                  garments,
                );

                final bottom =
                    garmentById(
                  outfit.bottomId,
                  garments,
                );

                final shoes =
                    garmentById(
                  outfit.shoesId,
                  garments,
                );

                return OutfitVisualCard(
                  outfitName:
                      outfit.name,

                  date: outfit
                      .createdAt
                      .split('T')
                      .first,

                  topImage:
                      top?.imagePath,

                  bottomImage:
                      bottom?.imagePath,

                  shoesImage:
                      shoes?.imagePath,

                  topName:
                      top?.name ??
                          'Sin prenda',

                  bottomName:
                      bottom?.name ??
                          'Sin prenda',

                  shoesName:
                      shoes?.name ??
                          'Sin prenda',
                );
              },
            ),
    );
  }
}