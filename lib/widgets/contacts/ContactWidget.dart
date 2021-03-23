import 'package:flutter/material.dart';
import 'package:ad_hoc_client/routes/ChatRoute.dart';

class ContactWidget extends StatelessWidget {
  final int id;

  ContactWidget(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 0, 5),
      child: ElevatedButton(
        child: Text('Friend ${this.id}'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatRoute(this.id),
            ),
          );
        },
      ),
    );
  }
}
