import 'package:ad_hoc_client/internal/Message.dart';
import 'package:flutter/material.dart';
import 'package:ad_hoc_client/config/Palette.dart';

class MessageWidget extends StatelessWidget {
  final Message msg;

  MessageWidget(this.msg);

  @override
  Widget build(BuildContext context) {
    if (!msg.isReceived) {
      // from me
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('${this.msg.text}', style: TextStyle(fontSize: 15.0),),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Row(
              children: [
                Text('${msg.date.hour}:${msg.date.minute}'),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
        color: Palette.fromMessageColor,
      );
    } else {
      // to me
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('${this.msg.text}'),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Row(
              children: [
                Text('${msg.date.hour}:${msg.date.minute}'),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ],
        ),
        color: Palette.toMessageColor,
      );
    }
  }
}
