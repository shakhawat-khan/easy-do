import 'package:easy_do/src/app.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late Future<Database> db;

late SharedPreferences preferences;

String appUserToken = "";
String appUserId = "";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  db = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'json.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE json(id INTEGER PRIMARY KEY, response TEXT)',
      );
    },
    version: 1,
  );
  // Obtain shared preferences.
  preferences = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
