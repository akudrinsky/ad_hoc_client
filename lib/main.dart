import 'package:flutter/material.dart';
import 'package:ad_hoc_client/routs/ContactsRout.dart';

void main() {
  
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
