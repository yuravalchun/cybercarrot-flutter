import 'package:cybercarrot/models/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Record extends StatefulWidget {

  String iconType;
  String text;

  Record({this.iconType, this.text});

  @override
  _RecordState createState() => _RecordState();
}

class _RecordState extends State<Record> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: 80,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getIcon(widget.iconType),
                TextButton(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        fontWeight: _isPressed ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (_isPressed) {
                          context.read<Data>().changeCount(-1);
                        } else {
                          context.read<Data>().changeCount(1);
                        }
                        _isPressed = !_isPressed;
                      });
                    }
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Icon getIcon(type) {
    switch (type) {
      case 'lock':
        return Icon(
          Icons.lock,
          size: 25,
        );
      case 'hashtag':
        return Icon(
          Icons.open_in_full,
          size: 25,
        );
    }
  }
}