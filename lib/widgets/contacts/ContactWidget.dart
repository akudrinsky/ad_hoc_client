import 'package:ad_hoc_client/internal/Contact.dart';
import 'package:flutter/material.dart';
import 'package:ad_hoc_client/routs/ChatRout.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;

  ContactWidget(this.contact);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      child: ElevatedButton(
        child: Text('${this.contact.name}'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRout(this.contact),
            ),
          );
        },
      ),
    );
  }
}
