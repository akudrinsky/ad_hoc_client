import 'package:flutter/material.dart';
import 'package:ad_hoc_client/widgets/chat/InputWidget.dart';
import 'package:ad_hoc_client/widgets/chat/MessageWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ad hoc client',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ex'),
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemBuilder: (context, index) => MessageWidget(index),
              reverse: true,
            ),
            Center(
              child: InputWidgetWidget(),
            ),
          ],
        ),
      ),
    );
  }
}