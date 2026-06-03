import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/outfit_provider.dart';

class OutfitHistoryScreen extends StatefulWidget {
  const OutfitHistoryScreen({
    super.key,
  });

  @override
  State<OutfitHistoryScreen> createState() =>
      _OutfitHistoryScreenState();
}

class _OutfitHistoryScreenState
    extends State<OutfitHistoryScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) {

      if (!mounted) return;

      context
          .read<OutfitProvider>()
          .loadOutfits();
    });
  }

  @override
  Widget build(
      BuildContext context) {

    final provider =
        context.watch<OutfitProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Historial de Outfits',
        ),
      ),

      body: provider.isLoading

          ? const Center(
              child:
                  CircularProgressIndicator(),
            )

          : provider.outfits.isEmpty

              ? const Center(
                  child: Text(
                    'No hay outfits guardados',
                  ),
                )

              : ListView.builder(
                  itemCount:
                      provider
                          .outfits
                          .length,

                  itemBuilder:
                      (
                    context,
                    index,
                  ) {

                    final outfit =
                        provider
                            .outfits[index];

                    return Card(
                      margin:
                          const EdgeInsets
                              .all(10),

                      child: ListTile(
                        leading:
                            const Icon(
                          Icons
                              .checkroom,
                        ),

                        title:
                            Text(
                          outfit.name,
                        ),

                        subtitle:
                            Text(
                          outfit
                              .createdAt,
                        ),

                        trailing:
                            IconButton(
                          icon:
                              const Icon(
                            Icons
                                .delete,
                            color:
                                Colors.red,
                          ),

                          onPressed:
                              () async {

                            await provider
                                .deleteOutfit(
                              outfit.id!,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}