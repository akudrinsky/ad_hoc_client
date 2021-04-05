import 'package:ad_hoc_client/internal/Contact.dart';
import 'package:ad_hoc_client/routs/ContactsRout.dart';
import 'package:flutter/material.dart';
import 'package:ad_hoc_client/widgets/chat/InputWidget.dart';
import 'package:ad_hoc_client/widgets/chat/MessageWidget.dart';
import 'package:ad_hoc_client/widgets/chat/OtherPersonBar.dart';

class ChatRout extends StatelessWidget {
  final Contact contact;

  ChatRout(this.contact);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OtherPersonBar("${this.contact.name}"),
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
                      builder: (context) => ContactsRout(),
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
