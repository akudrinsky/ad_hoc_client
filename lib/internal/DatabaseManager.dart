import 'Message.dart';
import 'Contact.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DatabaseManager {
  static final DatabaseManager _instance =
      DatabaseManager._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;

    _db = await initDB();

    return _db!;
  }

  factory DatabaseManager() {
    return _instance;
  }

  DatabaseManager._privateConstructor() {
    //_checkDB();
  }

  bool isOpen() {
    return _db == null ? false : _db!.isOpen;
  }

  Future<Database> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath!, 'ad_hoc_client.db');
    await ((await openDatabase(path)).close());
    await deleteDatabase(path);
    print("Opening database");
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE Messages (otherHandle TEXT, data TEXT, time TEXT, isReceived TEXT)');
        await db.execute(
            'CREATE TABLE Contacts (handle TEXT, public_key TEXT, name TEXT)');
        await db.execute(
            'CREATE TABLE Keys (public_key TEXT, private_key TEXT, identity_key TEXT)');
      },
    );

    return db;
  }

  void newMessage(Message msg) async {
    db.then((value) => value.rawInsert(
        'INSERT INTO Messages VALUES (\'${msg.otherHandle}\', \'${msg.text}\', \'${msg.date.toString()}\', \'${msg.isReceived}\')'));
    print('message added');
  }

  Future<List<Message>> getCorrespondance(Contact contact) async {
    var database = await db;
    var records =
        await database.query('Messages', where: '"handle" = ${contact.handle}');
    Future<List<Message>> messages = <Message>[] as Future<List<Message>>;
    for (var i = 0; i < records.length; i++) {
      messages.then((value) => value.add(Message(
          records[i]['otherHandle'] as String,
          records[i]['data'] as String,
          records[i]['time'] as DateTime,
          records[i]['isReceived'] as bool)));
    }

    return messages;
  }

  Future<List<Contact>> getUserContacts() async {
    var database = await db;
    var records = await database.query('Contacts').then((value) => value);
    Future<List<Contact>> contacts = <Contact>[] as Future<List<Contact>>;
    for (var i = 0; i < records.length; i++) {
      contacts.then((value) => value.add(Contact(records[i]['handle'] as String,
          records[i]['public_key'] as String, records[i]['name'] as String)));
    }

    return contacts;
  }

  void newContact(Contact contact) {
    db.then((value) => value.rawInsert(
        'INSERT INTO Contacts VALUES (\'${contact.handle}\', \'${contact.publicKey}\', \'${contact.name}\')'));
    print('concact added');
  }
}
