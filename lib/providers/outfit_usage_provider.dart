import 'package:flutter/material.dart';

import '../models/outfit_usage.dart';
import '../repositories/outfit_usage_repository.dart';

class OutfitUsageProvider
    extends ChangeNotifier {
  final OutfitUsageRepository
      _repository =
      OutfitUsageRepository();

  List<OutfitUsage> _usage = [];

  List<OutfitUsage> get usage =>
      _usage;

  bool _isLoading = false;

  bool get isLoading =>
      _isLoading;

  Future<void> loadUsage() async {
    _isLoading = true;

    notifyListeners();

    _usage =
        await _repository.getAllUsage();

    _isLoading = false;

    notifyListeners();
  }

  Future<void> addUsage(
    OutfitUsage usage,
  ) async {
    await _repository.insertUsage(
      usage,
    );

    await loadUsage();
  }

  Future<void> deleteUsage(
    int id,
  ) async {
    await _repository.deleteUsage(
      id,
    );

    await loadUsage();
  }

  Future<List<OutfitUsage>>
      getUsageByOutfit(
    int outfitId,
  ) async {
    return await _repository
        .getUsageByOutfit(
      outfitId,
    );
  }
}