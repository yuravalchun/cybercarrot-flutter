import 'package:cybercarrot/models/data.dart';
import 'package:cybercarrot/widgets/caption.dart';
import 'package:cybercarrot/widgets/chat.dart';
import 'package:cybercarrot/widgets/record.dart';
import 'package:cybercarrot/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


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
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: Text(context.watch<Data>().getCount),
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
                Record(iconType:'lock', text:'creatives-notification'),
                Record(iconType:'lock', text:'river-tech'),
                Caption(text:'Channels'),
                Record(iconType:'lock', text:'creatives-tech'),
                Record(iconType:'hashtag', text:'general'),
                Record(iconType:'lock', text:'main-tech-slack'),
                Record(iconType:'lock', text:'python-related-articles'),
                Record(iconType:'lock', text:'river-main'),
                Record(iconType:'lock', text:'ytc-infrastructure'),
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







