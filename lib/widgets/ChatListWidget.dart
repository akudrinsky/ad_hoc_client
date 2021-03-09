import 'package:flutter/material.dart';

import 'ChatItemWidget.dart';

class ChatListWidget extends StatelessWidget {
  final ScrollController listScrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ChatItemWidget(index),
      itemCount: 20,
      controller: listScrollController,
      reverse: true,
    );
  }
}
