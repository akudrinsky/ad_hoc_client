import 'package:flutter/material.dart';
import 'package:ad_hoc_client/config/Palette.dart';
import 'package:ad_hoc_client/widgets/contacts/ContactWidget.dart';

class ContactsRout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: ListView.separated(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: 5,
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
      ),
    );
  }
}
