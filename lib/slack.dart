import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text('Y')),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text('YTC'),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.search,
                    size: 25,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Search(),
                Chat(),
                Caption(text:'Unreads'),
                Record(type: FontWeight.bold, iconType:'lock', text:'creatives-notification'),
                Record(type: FontWeight.bold, iconType:'lock', text:'river-tech'),
                Caption(text:'Channels'),
                Record(type: FontWeight.normal, iconType:'lock', text:'creatives-tech'),
                Record(type: FontWeight.normal, iconType:'hashtag', text:'general'),
                Record(type: FontWeight.normal, iconType:'lock', text:'main-tech-slack'),
                Record(type: FontWeight.normal, iconType:'lock', text:'python-related-articles'),
                Record(type: FontWeight.normal, iconType:'lock', text:'river-main'),
                Record(type: FontWeight.normal, iconType:'lock', text:'ytc-infrastructure'),
                Caption(text:'Direct-messages'),

              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: Container(
              width: 60,
              height: 60,
              child: Icon(
                Icons.edit_location_outlined,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}

class Record extends StatelessWidget {

  FontWeight type;
  String iconType;
  String text;

  Record({this.type, this.iconType, this.text});

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
                getIcon(iconType),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: type,
                  ),
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

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 40,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border(
                top: BorderSide(width: 1.0, color: Colors.grey),
                left: BorderSide(width: 1.0, color: Colors.grey),
                right: BorderSide(width: 1.0, color: Colors.grey),
                bottom: BorderSide(width: 1.0, color: Colors.grey),
              ),
            ),
            child: Text('Jump to ...'),
          ),
        ),
      ],
    );
  }
}

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
