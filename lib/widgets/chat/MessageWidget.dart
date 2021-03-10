import 'package:flutter/material.dart';
import 'package:ad_hoc_client/config/Palette.dart';

class MessageWidget extends StatelessWidget {
  final int index;

  MessageWidget(this.index);

  @override
  Widget build(BuildContext context) {
    if (this.index % 2 == 0) {
      // from me
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('from me ${this.index}'),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
            Row(
              children: [
                Text('${DateTime.now().hour}:${DateTime.now().minute}'),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
        color: Palette.primaryDesignColor,
      );
    } else {
      // to me
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text('to me ${this.index}'),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Row(
              children: [
                Text('${DateTime.now().hour}:${DateTime.now().minute}'),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ],
        ),
        color: Palette.secondaryDesignColor,
      );
    }
  }
}
