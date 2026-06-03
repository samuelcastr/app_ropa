import 'package:flutter/material.dart';
import 'app.dart';
import 'db/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa la base de datos SQLite
  await DatabaseHelper.instance.database;

  runApp(
    const ClosetAIApp(),
  );
}