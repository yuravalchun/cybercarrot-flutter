import 'package:cybercarrot/slack.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Slack(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Главная')),
//       body: Container(
//         child: Center(
//           child: Text('ebat privet')
//         )
//       )
//     );
//   }
// }

