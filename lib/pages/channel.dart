import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:cybercarrot/widgets/bottom_menu.dart';
import 'package:cybercarrot/models/data.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> with TickerProviderStateMixin  {

  Future<Fund> futureFund;
  AnimationController _controller;
  AnimationController _secondController;
  AnimationController _thirdController;
  AnimationController _forthController;
  AnimationController _fifthController;
  Animation _myAnimation;
  Animation _mySecondAnimation;
  Animation _myThirdAnimation;
  Animation _myForthAnimation;
  Animation _myFifthAnimation;

  @override
  void initState() {
    super.initState();

    futureFund = fetchFund();

    /* first element */
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),

    );

    _myAnimation = Tween<Size>(
        begin: Size(50, 50),
        end:  Size(150, 25)
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut)
    );

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _secondController.forward();
      }
    });


    /* second element */
    _secondController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),

    );

    _mySecondAnimation = Tween<Size>(
        begin: Size(50, 50),
        end:  Size(120, 25)
    ).animate(
        CurvedAnimation(parent: _secondController, curve: Curves.elasticOut)
    );

    _secondController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _thirdController.forward();
      }
    });


    /* third element */
    _thirdController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _myThirdAnimation = Tween<Size>(
        begin: Size(50, 50),
        end:  Size(90, 25)
    ).animate(
        CurvedAnimation(parent: _thirdController, curve: Curves.elasticOut)
    );

    _thirdController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _forthController.forward();
      }
    });


    /* forth element */
    _forthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _myForthAnimation = Tween<Size>(
        begin: Size(50, 50),
        end:  Size(15, 200)
    ).animate(
        CurvedAnimation(parent: _forthController, curve: Curves.elasticOut)
    );

    _forthController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _fifthController.forward();
      }
    });


    /* fifth element */
    _fifthController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );

    _myFifthAnimation = Tween<Size>(
        begin: Size(1, 1),
        end:  Size(200, 50)
    ).animate(
        CurvedAnimation(parent: _fifthController, curve: Curves.bounceIn)
    );

    _fifthController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _fifthController.repeat();
      }
    });


  }

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
      body: Column(
        children: [
          Center(
              child:
              AnimatedBuilder(animation: _myAnimation,
                  builder: (ctx, ch) =>  Container(
                    width: _myAnimation.value.width,
                    height: _myAnimation.value.height,
                    color: Colors.deepPurple
                  )
              ),
          ),

          Center(
            child:
            AnimatedBuilder(animation: _mySecondAnimation,
                builder: (ctx, ch) =>  Container(
                    width: _mySecondAnimation.value.width,
                    height: _mySecondAnimation.value.height,
                    color: Colors.red
                )
            ),
          ),

          Center(
            child:
            AnimatedBuilder(animation: _myThirdAnimation,
                builder: (ctx, ch) =>  Container(
                    width: _myThirdAnimation.value.width,
                    height: _myThirdAnimation.value.height,
                    color: Colors.orange
                )
            ),
          ),

          Center(
            child:
            AnimatedBuilder(animation: _myForthAnimation,
                builder: (ctx, ch) =>  Container(
                    width: _myForthAnimation.value.width,
                    height: _myForthAnimation.value.height,
                    color: Colors.blue
                )
            ),
          ),

          Center(
            child:
            AnimatedBuilder(animation: _myFifthAnimation,
                builder: (ctx, ch) =>  Container(
                    child: Center(
                        child: Text(
                          'Hello World',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        )
                    ),
                    width: _myFifthAnimation.value.width,
                    height: _myFifthAnimation.value.height,
                    color: Colors.white70
                )
            ),
          ),

          FloatingActionButton(
            onPressed: () {
              HttpServer.bind('127.0.0.1', 8000)
                  .then((server) => print('${server.address}'))
                  .catchError(print);

              _controller.forward();
            },
            child: Text(context.watch<Data>().getCount),
          ),

          Center(
            child: FutureBuilder<Fund>(
              future: futureFund,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.name);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          )

        ],
      ),
      bottomNavigationBar: BottomMenu(),
    );
  }
}

Future<Fund> fetchFund() async {
  final response =
  await http.get('http://river.yourcofounder.com.ua:8000/fund/1/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Fund.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Fund');
  }
}

class Fund {
  final int id;
  final String name;

  Fund({this.id, this.name});

  factory Fund.fromJson(Map<String, dynamic> json) {
    return Fund(
      name: json['name'],
    );
  }
}







