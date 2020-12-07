import 'package:flutter/material.dart';


class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.textsms),
            title: Text("DMs"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alternate_email),
            title: Text("Mentions"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text("You"),
          ),
        ]
    );
  }
}