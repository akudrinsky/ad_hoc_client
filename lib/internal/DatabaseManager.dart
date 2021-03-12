import 'Message.dart';
import 'Contact.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager _instance =
      DatabaseManager._privateConstructor();

  late Database _db;

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._privateConstructor() {
    //_checkDB();
  }

  bool isOpen() {
    return _db.isOpen;
  }

  Future openDB() async {
    if (!_db.isOpen) {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath!, 'ad_hoc_client.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await _db.execute(
              'CREATE TABLE Messages (otherHandle TEXT, data TEXT, time TEXT, fromHim TEXT)');
          await _db.execute(
              'CREATE TABLE Contacts (handle TEXT, sender TEXT, name TEXT)');
          await _db.execute(
              'CREATE TABLE Keys (public_key TEXT, private_key TEXT, identity_key TEXT)');
        },
      );
    }
  }

  void newMessage(Message msg) async {
    await _db.rawInsert('INSERT INTO Messages VALUES (${msg.otherHandle}, ${msg.text}, ${msg.date.toString()}, ${msg.fromHim})');
  }

  Future<List<Map<String, dynamic>>> getCorrespondance(Contact contact) {
    var records = _db.query('Messages', where: '"handle" = ${contact.handle}');
    print(records);
    return records;
  }

  Future<List<Map<String, dynamic>>> getUserContacts() {
    var records = _db.query('Contacts').then((value) => value);
    print(records);
    return records;
  }

  void newContact(Contact contact) async {
    await _db.rawInsert('INSERT INTO Contacts VALUES (${contact.handle}, ${contact.sender}, ${contact.name})');
  }
}
