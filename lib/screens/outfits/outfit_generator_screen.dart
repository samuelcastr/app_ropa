import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/garment.dart';
import '../../models/outfit.dart';
import '../../models/outfit_request.dart';
import '../../models/weather_type.dart';
import '../../providers/garment_provider.dart';
import '../../providers/outfit_provider.dart';
import '../../services/outfit_generator_service.dart';
import 'outfit_history_screen.dart';

class OutfitGeneratorScreen extends StatefulWidget {
  const OutfitGeneratorScreen({super.key});

  @override
  State<OutfitGeneratorScreen> createState() => _OutfitGeneratorScreenState();
}

class _OutfitGeneratorScreenState extends State<OutfitGeneratorScreen> {
  final OutfitGeneratorService _generator = OutfitGeneratorService();

  List<Garment> _outfit = [];

  String _occasion = 'Universidad';

  WeatherType _weather = WeatherType.sunny;

  @override
  Widget build(BuildContext context) {
    final garments = context.watch<GarmentProvider>().garments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generador de Outfit'),

        actions: [
          IconButton(
            icon: const Icon(Icons.history),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const OutfitHistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              initialValue: _occasion,
              decoration: const InputDecoration(
                labelText: 'Ocasión',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Universidad',
                  child: Text('Universidad'),
                ),
                DropdownMenuItem(
                  value: 'Presentación',
                  child: Text('Presentación'),
                ),
                DropdownMenuItem(
                  value: 'Evento Académico',
                  child: Text('Evento Académico'),
                ),
                DropdownMenuItem(
                  value: 'Salida Casual',
                  child: Text('Salida Casual'),
                ),
              ],
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  _occasion = value;
                });
              },
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField<WeatherType>(
              initialValue: _weather,
              decoration: const InputDecoration(
                labelText: 'Clima',
                border: OutlineInputBorder(),
              ),
              items: WeatherType.values.map((weather) {
                return DropdownMenuItem(
                  value: weather,
                  child: Text(weather.name),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) {
                  return;
                }

                setState(() {
                  _weather = value;
                });
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _outfit = _generator.generateOutfit(
                    garments: garments,
                    request: OutfitRequest(
                      occasion: _occasion,
                      weather: _weather,
                    ),
                  );
                });
              },
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Generar Outfit'),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              onPressed: _outfit.length < 3
                  ? null
                  : () async {
                      final provider = context.read<OutfitProvider>();

                      final messenger = ScaffoldMessenger.of(context);

                      final outfit = Outfit(
                        name:
                            'Outfit ${DateTime.now().day}/${DateTime.now().month}',
                        topId: _outfit[0].id,
                        bottomId: _outfit[1].id,
                        shoesId: _outfit[2].id,
                        createdAt: DateTime.now().toIso8601String(),
                      );

                      await provider.addOutfit(outfit);

                      if (!mounted) return;
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text('Outfit guardado correctamente'),
                        ),
                      );
                    },
              icon: const Icon(Icons.favorite),
              label: const Text('Guardar Outfit'),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: _outfit.isEmpty
                  ? const Center(
                      child: Text('Genera un outfit para visualizarlo'),
                    )
                  : ListView.builder(
                      itemCount: _outfit.length,
                      itemBuilder: (context, index) {
                        final garment = _outfit[index];

                        return Card(
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.checkroom),
                            title: Text(garment.name),
                            subtitle: Text(garment.category),
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
