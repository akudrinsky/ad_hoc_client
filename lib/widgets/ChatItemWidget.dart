import 'package:flutter/material.dart';
import 'package:ad_hoc_client/config/Palette.dart';

class ChatItemWidget extends StatelessWidget {
  final index;

  ChatItemWidget(this.index);

  @override
  Widget build(BuildContext context) {
    return Text("asd");
    return Center(
      child: Column(
        children: [
          _TextChatItem('Some text from me.'),
          _DateTimeItem(DateTime.now()),
        ],
      ),
    );
  }
}

class _TextChatItem extends StatelessWidget {
  final String text;

  _TextChatItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Text("def");
    return Row(
      children: [
        Container(
          child: Text(
            text,
            textDirection: TextDirection.ltr,
          ),
          padding: EdgeInsets.fromLTRB(5.0, 5.0, 2.0, 0.0),
          decoration: BoxDecoration(
            color: Palette.selfMessageBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ],
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}

class _DateTimeItem extends StatelessWidget {
  final DateTime datetime;

  _DateTimeItem(this.datetime);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            "${datetime.day}-${datetime.month} : ${datetime.hour}-${datetime.minute}",
            textDirection: TextDirection.ltr,
          ),
          color: Colors.grey,
          margin: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
        ),
      ],
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.end,
    );
  }
}
