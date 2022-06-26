import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//Utils folders are used to store  functions that are used in multiple places.

class PageNavigator {
  //PageNavigator variable and  Constructor
  BuildContext? ctx;

  PageNavigator({this.ctx});

  //Navigate to nect page using Cupertino page Route
  Future nextPage(Widget? page) {
    return Navigator.push(
        ctx!, CupertinoPageRoute(builder: (context) => page!));
  }

  void nextPageOnly(Widget? page) {
    Navigator.pushAndRemoveUntil(
        ctx!, MaterialPageRoute(builder: (context) => page!), (route) => false);
  }
}
