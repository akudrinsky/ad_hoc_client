import 'package:flutter/material.dart';
import 'package:ad_hoc_client/config/Palette.dart';
import 'package:ad_hoc_client/widgets/contacts/ContactWidget.dart';
import 'package:ad_hoc_client/internal/DatabaseManager.dart';

class ContactsRout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactsRoutState();
  }
}

class _ContactsRoutState extends State<ContactsRout> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseManager().openDB(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> dbOpened) {
        if (dbOpened.hasData) {
          Future<List<Map<String, dynamic>>> contacts =
              DatabaseManager().getUserContacts();
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Contacts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Palette.primaryDesignColor,
            ),
            body: FutureBuilder(
              future: contacts,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: 75,
                        right: 20,
                      ),
                      child: Divider(
                        color: Palette.smallDetailColor,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return ContactWidget(index);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  return Text("Waiting");
                }
              },
            ),
          );
        } else if (dbOpened.hasError) {
          return Text("Error loading DB");
        } else {
          return Text("Waiting for DB");
        }
      },
    );
  }
}
