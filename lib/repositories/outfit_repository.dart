import '../db/database_helper.dart';
import '../models/outfit.dart';

class OutfitRepository {
  Future<int> insert(
    Outfit outfit,
  ) async {
    final db =
        await DatabaseHelper
            .instance
            .database;

    return db.insert(
      'outfits',
      outfit.toMap(),
    );
  }

  Future<List<Outfit>> getAll()
      async {
    final db =
        await DatabaseHelper
            .instance
            .database;

    final result =
        await db.query(
      'outfits',
      orderBy:
          'createdAt DESC',
    );

    return result
        .map(
          (e) =>
              Outfit.fromMap(e),
        )
        .toList();
  }

  Future<void> delete(
    int id,
  ) async {
    final db =
        await DatabaseHelper
            .instance
            .database;

    await db.delete(
      'outfits',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}