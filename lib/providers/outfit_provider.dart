import 'package:flutter/material.dart';

import '../models/outfit.dart';
import '../repositories/outfit_repository.dart';

class OutfitProvider
    extends ChangeNotifier {

  final OutfitRepository
      _repository =
      OutfitRepository();

  List<Outfit> outfits = [];

  bool isLoading = false;

  Future<void> loadOutfits()
      async {

    isLoading = true;
    notifyListeners();

    outfits =
        await _repository
            .getAll();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addOutfit(
    Outfit outfit,
  ) async {

    await _repository.insert(
      outfit,
    );

    await loadOutfits();
  }

  Future<void> deleteOutfit(
    int id,
  ) async {

    await _repository.delete(
      id,
    );

    await loadOutfits();
  }
}