import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/garment.dart';
import '../../providers/garment_provider.dart';
import '../../services/image_service.dart';

class GarmentFormScreen extends StatefulWidget {
  const GarmentFormScreen({super.key});

  @override
  State<GarmentFormScreen> createState() =>
      _GarmentFormScreenState();
}

class _GarmentFormScreenState
    extends State<GarmentFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController =
      TextEditingController();

  final _brandController =
      TextEditingController();

  final ImageService _imageService =
      ImageService();

  String? _imagePath;

  String _category = 'Blusa';

  final String _color = 'Negro';
  final String _size = 'S';
  final String _season = 'Todo el año';
  final String _occasion = 'Universidad';

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nueva Prenda',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          _imagePath != null
                              ? FileImage(
                                  File(
                                    _imagePath!,
                                  ),
                                )
                              : null,
                      child: _imagePath == null
                          ? const Icon(
                              Icons.image,
                              size: 40,
                            )
                          : null,
                    ),
                    TextButton(
                      onPressed: () async {
                        final image =
                            await _imageService
                                .pickAndSaveImage();

                        if (image == null) {
                          return;
                        }

                        setState(() {
                          _imagePath = image;
                        });
                      },
                      child: const Text(
                        'Seleccionar imagen',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller:
                    _nameController,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Nombre de la prenda',
                  border:
                      OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Ingrese un nombre';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller:
                    _brandController,
                decoration:
                    const InputDecoration(
                  labelText: 'Marca',
                  border:
                      OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration:
                    const InputDecoration(
                  labelText:
                      'Categoría',
                  border:
                      OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Blusa',
                    child:
                        Text('Blusa'),
                  ),
                  DropdownMenuItem(
                    value:
                        'Camiseta',
                    child: Text(
                      'Camiseta',
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Jean',
                    child:
                        Text('Jean'),
                  ),
                  DropdownMenuItem(
                    value:
                        'Falda',
                    child:
                        Text('Falda'),
                  ),
                  DropdownMenuItem(
                    value:
                        'Vestido',
                    child: Text(
                      'Vestido',
                    ),
                  ),
                  DropdownMenuItem(
                    value:
                        'Chaqueta',
                    child: Text(
                      'Chaqueta',
                    ),
                  ),
                  DropdownMenuItem(
                    value:
                        'Tenis',
                    child:
                        Text('Tenis'),
                  ),
                  DropdownMenuItem(
                    value:
                        'Botas',
                    child:
                        Text('Botas'),
                  ),
                ],
                onChanged: (
                  value,
                ) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _category =
                        value;
                  });
                },
              ),

              const SizedBox(height: 24),

              SizedBox(
                height: 50,
                child:
                    ElevatedButton(
                  onPressed:
                      _saveGarment,
                  child:
                      const Text(
                    'Guardar',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveGarment() async {
    if (!_formKey.currentState!
        .validate()) {
      return;
    }

    final garment = Garment(
      name:
          _nameController.text,
      category: _category,
      color: _color,
      size: _size,
      brand:
          _brandController.text,
      season: _season,
      occasion: _occasion,
      imagePath: _imagePath,
      isFavorite: false,
      lastWorn: null,
      createdAt:
          DateTime.now()
              .toIso8601String(),
    );

    await context
        .read<GarmentProvider>()
        .addGarment(
          garment,
        );

    if (!mounted) {
      return;
    }

    Navigator.pop(context);
  }
}