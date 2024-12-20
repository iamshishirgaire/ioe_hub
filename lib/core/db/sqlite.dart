import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

@Injectable()
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Database? _database;

  // Singleton pattern to ensure a single instance of the database
  Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    // Initialize the database if it's not yet available
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'app.db');

    // Check if the database already exists
    bool exists = await databaseExists(path);

    if (!exists) {
      // Copy database from assets to the device
      ByteData data = await rootBundle.load('assets/app.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to database path
      await File(path).writeAsBytes(bytes);
    }

    return await openDatabase(path);
  }
}
