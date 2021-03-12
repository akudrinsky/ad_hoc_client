import 'package:flutter/material.dart';
import 'package:ad_hoc_client/routs/ContactsRout.dart';
import 'package:ad_hoc_client/internal/DatabaseManager.dart';

void main() async {
  DatabaseManager();
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
