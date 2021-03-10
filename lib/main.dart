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
        body: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemBuilder: (context, index) => MessageWidget(index),
                reverse: true,
              ),
              flex: 15,
            ),
            Flexible(
              child: InputWidgetWidget(),
              flex: 2,
            ),
            //Center(child: InputWidgetWidget(),),
          ],
        ),
      ),
    );
  }
}
