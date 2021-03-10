import 'package:ad_hoc_client/config/Palette.dart';
import 'package:flutter/material.dart';

class InputWidgetWidget extends StatelessWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  // Think about SafeArea
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        child: Row(
          children: [
            Flexible(
              child: Container(
                child: TextField(
                  style: TextStyle(
                      color: Palette.primaryTextColor, fontSize: 15.0),
                  controller: textEditingController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Send a message',
                    hintStyle: TextStyle(color: Palette.secondaryTextColor),
                  ),
                ),
              ),
            ),
            Material(
              child: new Container(
                margin: new EdgeInsets.symmetric(horizontal: 8.0),
                child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => {},
                  color: Palette.primaryDesignColor,
                ),
              ),
              color: Colors.white,
            ),
          ],
        ),
        width: double.infinity,
        //height: 50.0,
        decoration: new BoxDecoration(
          border: new Border(
            top: new BorderSide(color: Palette.secondaryTextColor, width: 0.5),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
