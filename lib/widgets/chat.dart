import 'package:flutter/material.dart';


class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.message,
                size: 25,
              ),
              Text('Threads'),
            ],
          ),
        ),
      ],
    );
  }
}