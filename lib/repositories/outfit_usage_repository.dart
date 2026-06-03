import 'package:app_ropa/db/database_helper.dart';
import 'package:app_ropa/models/outfit_usage.dart';

class OutfitUsageRepository {
  final DatabaseHelper _databaseHelper =
      DatabaseHelper.instance;

  Future<int> insertUsage(
    OutfitUsage usage,
  ) async {
    final db =
        await _databaseHelper.database;

    return await db.insert(
      'outfit_usage',
      usage.toMap(),
    );
  }

  Future<List<OutfitUsage>>
      getAllUsage() async {
    final db =
        await _databaseHelper.database;

    final result =
        await db.query(
      'outfit_usage',
    );

    return result
        .map(
          (e) => OutfitUsage.fromMap(e),
        )
        .toList();
  }

  Future<List<OutfitUsage>>
      getUsageByOutfit(
    int outfitId,
  ) async {
    final db =
        await _databaseHelper.database;

    final result =
        await db.query(
      'outfit_usage',
      where: 'outfitId = ?',
      whereArgs: [outfitId],
    );

    return result
        .map(
          (e) => OutfitUsage.fromMap(e),
        )
        .toList();
  }

  Future<int> deleteUsage(
    int id,
  ) async {
    final db =
        await _databaseHelper.database;

    return await db.delete(
      'outfit_usage',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}