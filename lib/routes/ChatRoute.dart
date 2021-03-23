import 'package:ad_hoc_client/routes/ContactsRoute.dart';
import 'package:flutter/material.dart';
import 'package:ad_hoc_client/widgets/chat/InputWidget.dart';
import 'package:ad_hoc_client/widgets/chat/MessageWidget.dart';
import 'package:ad_hoc_client/widgets/chat/OtherPersonBar.dart';

class ChatRoute extends StatelessWidget {
  final int id;

  ChatRoute(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtherPersonBar("${this.id}"),
      body: Column(
        children: [
          Flexible(
            child: GestureDetector(
              child: ListView.builder(
                itemBuilder: (context, index) => MessageWidget(index),
                reverse: true,
              ),
              onPanUpdate: (details) {
                if (details.delta.dx > 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactsRoute(),
                    ),
                  );
                }
              },
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
    );
  }
}
