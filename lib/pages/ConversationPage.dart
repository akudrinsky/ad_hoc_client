import 'package:flutter/material.dart';
import 'package:ad_hoc_client/widgets/ChatAppBar.dart';
import 'package:ad_hoc_client/widgets/ChatListWidget.dart';
import 'package:ad_hoc_client/widgets/InputWidget.dart';

class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: ChatAppBar(), // Custom app bar for chat screen
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ChatListWidget(), //Chat list
                InputWidget() // The input widget
              ],
            ),
          ],
        ),
      ),
    );
  }
}
