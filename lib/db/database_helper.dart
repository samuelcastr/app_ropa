import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'closet_ai.db');

    

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
    CREATE TABLE garments(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      category TEXT NOT NULL,
      color TEXT NOT NULL,
      size TEXT NOT NULL,
      brand TEXT NOT NULL,
      season TEXT NOT NULL,
      occasion TEXT NOT NULL,
      imagePath TEXT,
      isFavorite INTEGER DEFAULT 0,
      lastWorn TEXT,
      createdAt TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE outfits(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      topId INTEGER,
      bottomId INTEGER,
      shoesId INTEGER,
      accessoryId INTEGER,
      notes TEXT,
      createdAt TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE outfit_usage(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      outfitId INTEGER NOT NULL,
      usedAt TEXT NOT NULL
    )
    ''');
  }
}
