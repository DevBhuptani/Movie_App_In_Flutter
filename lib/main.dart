import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'delayed_animation.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.purple[900],
          body: Padding(
            padding: const EdgeInsets.all(88.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  AvatarGlow(
                    endRadius: 90,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white24,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 2),
                    startDelay: Duration(seconds: 1),
                    child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          backgroundImage:AssetImage('assets/images.jpg'),
                          radius: 50.0,
                        )),
                  ),
                  DelayedAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            color: color),
                      ),
                    ),
                    delay: delayedAmount + 1000,
                  ),
                  DelayedAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "I'm Movie Lover",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: color),
                      ),
                    ),
                    delay: delayedAmount + 2000,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  // DelayedAnimation(
                  //   child: Text(
                  //     "Your New Private Tutor",
                  //     style: TextStyle(fontSize: 20.0, color: color),
                  //   ),
                  //   delay: delayedAmount + 3000,
                  // ),
                  // SizedBox(
                  //   height: 100.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DelayedAnimation(
                    child: GestureDetector(
                      onTapDown: _onTapDown,
                      onTapUp: _onTapUp,
                      child: Transform.scale(
                        scale: _scale,
                        child: _animatedButtonUI,
                      ),
                    ),
                    delay: delayedAmount + 3000,
                ),
                  ),
                SizedBox(height: 50.0,),
                  // DelayedAnimation(
                  //   child: Text(
                  //     "I Already have An Account".toUpperCase(),
                  //     style: TextStyle(
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.bold,
                  //         color: color),
                  //   ),
                  //   delay: delayedAmount + 5000,
                  // ),
                ],
              ),
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: FlatButton(

            onPressed: () async {
            const url ='https://imdb.com';
            if(await canLaunch(url)) {
              await launch(url);
            } else {
              throw 'Could not launch $url';
            }
          }, child: Text("Let's get started",style: TextStyle(fontSize: 20.0),),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }
}