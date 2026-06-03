import 'package:app_ropa/db/database_helper.dart';
import 'package:app_ropa/models/garment.dart';

class GarmentRepository {
  final DatabaseHelper _databaseHelper =
      DatabaseHelper.instance;

  Future<int> insertGarment(
    Garment garment,
  ) async {
    final db =
        await _databaseHelper.database;

    return await db.insert(
      'garments',
      garment.toMap(),
    );
  }

  Future<List<Garment>>
      getAllGarments() async {
    final db =
        await _databaseHelper.database;

    final result =
        await db.query('garments');

    return result
        .map(
          (e) => Garment.fromMap(e),
        )
        .toList();
  }

  Future<Garment?>
      getGarmentById(
    int id,
  ) async {
    final db =
        await _databaseHelper.database;

    final result =
        await db.query(
      'garments',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isEmpty) {
      return null;
    }

    return Garment.fromMap(
      result.first,
    );
  }

  Future<int> updateGarment(
    Garment garment,
  ) async {
    final db =
        await _databaseHelper.database;

    return await db.update(
      'garments',
      garment.toMap(),
      where: 'id = ?',
      whereArgs: [garment.id],
    );
  }

  Future<int> deleteGarment(
    int id,
  ) async {
    final db =
        await _databaseHelper.database;

    return await db.delete(
      'garments',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}