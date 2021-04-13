import 'package:ad_hoc_client/internal/Contact.dart';
import 'package:ad_hoc_client/internal/Message.dart';
import 'package:flutter/material.dart';
import 'package:ad_hoc_client/routs/ContactsRout.dart';
import 'package:ad_hoc_client/internal/DatabaseManager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseManager().initDB();
  DatabaseManager().newContact(
    Contact('c033ee', '1', 'volkov'),
  );
  DatabaseManager().newContact(
    Contact('banana', '2', 'bananastas'),
  );
  DatabaseManager()
      .newMessage(Message('c033ee', 'hello!', DateTime.now(), true));
  DatabaseManager()
      .newMessage(Message('c033ee', 'hello!', DateTime.now(), false));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ad hoc client',
      home: ContactsRout(),
    );
  }
}
