import 'package:flutter/material.dart';
import 'package:ad_hoc_client/config/Palette.dart';

class OtherPersonBar extends StatelessWidget implements PreferredSizeWidget {
  final String personName;

  OtherPersonBar(this.personName);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: ColoredBox(
        child: Row(
          children: [
            Flexible(
              flex: 7,
              child: Text(
                personName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 2,
              child: Icon(Icons.directions_railway),
            ),
          ],
        ),
        color: Palette.primaryDesignColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
