import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/garment_provider.dart';
import 'garment_form_screen.dart';

import 'dart:io';
import '../../models/garment.dart';
import '../outfits/outfit_generator_screen.dart';

class GarmentListScreen
    extends StatefulWidget {
  const GarmentListScreen({
    super.key,
  });

  @override
  State<GarmentListScreen>
      createState() =>
          _GarmentListScreenState();
}

class _GarmentListScreenState
    extends State<
        GarmentListScreen> {

  @override
  void initState() {
  super.initState();

  WidgetsBinding.instance
      .addPostFrameCallback((_) {
    if (!mounted) return;

    context
        .read<GarmentProvider>()
        .loadGarments();
  });
}

  @override
  Widget build(
      BuildContext context) {

    final provider =
        context.watch<
            GarmentProvider>();

    return Scaffold(
      appBar: AppBar(
  title: const Text(
    'Mi Closet',
  ),

  actions: [
    IconButton(
      icon: const Icon(
        Icons.auto_awesome,
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
  ],
),

      floatingActionButton:
          FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  const GarmentFormScreen(),
            ),
          );

          if (!mounted) return;

          provider.loadGarments();
        },

        child:
            const Icon(Icons.add),
      ),

      body: provider.isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : provider.garments.isEmpty
              ? const Center(
                  child: Text(
                    'No hay prendas registradas',
                  ),
                )
              : ListView.builder(
                  itemCount:
                      provider
                          .garments
                          .length,

                  itemBuilder:
                      (context,
                          index) {

                    final garment =
                        provider
                            .garments[index];

                    return Dismissible(
  key: ValueKey(
    garment.id,
  ),

  background: Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(
      right: 20,
    ),
    color: Colors.red,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
    ),
  ),

  onDismissed: (_) async {
    await provider.deleteGarment(
      garment.id!,
    );
  },

  child: Card(
    margin: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),

    child: ListTile(
      leading:
          garment.imagePath != null
              ? CircleAvatar(
                  radius: 28,
                  backgroundImage:
                      FileImage(
                    File(
                      garment.imagePath!,
                    ),
                  ),
                )
              : const CircleAvatar(
                  radius: 28,
                  child: Icon(
                    Icons.checkroom,
                  ),
                ),

      title: Text(
        garment.name,
      ),

      subtitle: Text(
        '${garment.category} • ${garment.brand}',
      ),

      trailing: IconButton(
        icon: Icon(
          garment.isFavorite
              ? Icons.favorite
              : Icons.favorite_border,
        ),

        onPressed: () async {
          final updated =
              Garment(
            id: garment.id,
            name: garment.name,
            category:
                garment.category,
            color:
                garment.color,
            size: garment.size,
            brand:
                garment.brand,
            season:
                garment.season,
            occasion:
                garment.occasion,
            imagePath:
                garment.imagePath,
            isFavorite:
                !garment.isFavorite,
            lastWorn:
                garment.lastWorn,
            createdAt:
                garment.createdAt,
          );

          await provider
              .updateGarment(
            updated,
          );
        },
      ),
    ),
  ),
);
                  },
                ),
    );
  }
}