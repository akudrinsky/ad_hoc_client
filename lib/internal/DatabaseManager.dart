import 'Message.dart';
import 'Contact.dart';

import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static final DatabaseManager _instance = DatabaseManager._privateConstructor();
  Database _db;

  DatabaseManager._privateConstructor();

  _checkOpenDB() async {
    if (!_db.isOpen) {
      _db = await openDatabase('messages.db');
    }
  }

  NewMessage(Message msg) {
    _checkOpenDB();

    

  }

  factory DatabaseManager() {
    return _instance;
  }


}
