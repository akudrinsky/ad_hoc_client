import 'package:ad_hoc_client/internal/Contact.dart';
import 'package:ad_hoc_client/internal/Message.dart';
import 'package:ad_hoc_client/routs/ContactsRout.dart';
import 'package:flutter/material.dart';
import 'package:ad_hoc_client/widgets/chat/InputWidget.dart';
import 'package:ad_hoc_client/widgets/chat/MessageWidget.dart';
import 'package:ad_hoc_client/widgets/chat/OtherPersonBar.dart';
import 'package:ad_hoc_client/internal/DatabaseManager.dart';

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
            child: FutureBuilder(
              future: DatabaseManager().getCorrespondance(contact),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Message>> msgSnap) {
                if (msgSnap.hasData) {
                  return GestureDetector(
                    child: ListView.builder(
                      itemCount: msgSnap.data!.length,
                      itemBuilder: (context, index) {
                        return MessageWidget(msgSnap.data![index]);
                      },
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
                  );
                } else if (msgSnap.hasError) {
                  print(msgSnap.error.toString());
                  return Text("Error with messages");
                } else {
                  return Text("Waiting for messages");
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
