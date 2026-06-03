import 'package:flutter/material.dart';

import '../models/garment.dart';
import '../repositories/garment_repository.dart';

class GarmentProvider extends ChangeNotifier {
  final GarmentRepository _repository =
      GarmentRepository();

  List<Garment> _garments = [];

  List<Garment> get garments =>
      _garments;

  bool _isLoading = false;

  bool get isLoading =>
      _isLoading;

  Future<void> loadGarments() async {
    _isLoading = true;
    notifyListeners();

    _garments =
        await _repository.getAllGarments();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addGarment(
    Garment garment,
  ) async {
    await _repository.insertGarment(
      garment,
    );

    await loadGarments();
  }

  Future<void> updateGarment(
    Garment garment,
  ) async {
    await _repository.updateGarment(
      garment,
    );

    await loadGarments();
  }

  Future<void> deleteGarment(
    int id,
  ) async {
    await _repository.deleteGarment(
      id,
    );

    await loadGarments();
  }

  Future<Garment?> getGarmentById(
    int id,
  ) async {
    return await _repository
        .getGarmentById(id);
  }
}