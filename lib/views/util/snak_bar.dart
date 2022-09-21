import 'package:flutter/material.dart';

class Snak {
  void showsnak(
      {BuildContext context,
      String content,
      Color backgroundcolor,
      Color fontcolor}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        dismissDirection: DismissDirection.up,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, color: fontcolor, letterSpacing: 5),
        ),
        backgroundColor: backgroundcolor,
      ),
    );
  }
}
