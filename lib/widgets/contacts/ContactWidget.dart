import 'package:flutter/material.dart';
import 'package:ad_hoc_client/routs/ChatRout.dart';

class ContactWidget extends StatelessWidget {
  final int id;

  ContactWidget(this.id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      child: ElevatedButton(
        child: Text('Friend ${this.id}'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRout(this.id),
            ),
          );
        },
      ),
    );
  }
}
