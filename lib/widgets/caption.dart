import 'package:flutter/material.dart';


class Caption extends StatelessWidget {

  String text;

  Caption({this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 120,
            height: 30,
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
