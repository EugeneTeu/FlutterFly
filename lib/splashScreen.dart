import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Colors.purple,
          gradient: LinearGradient(colors: [Colors.purple, Colors.red, Colors.blue[400]])
        ),
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Spacer(flex: 20,),
                FlutterLogo(
                  size: 100.0,
                ),
                new Spacer(flex: 1,),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "FLUTTERFLY",
                        style: TextStyle(
                            fontFamily: "sans-serif",
                            fontSize: 50.0,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                ),
                new Spacer(
                  flex:1
                ),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "For the flutter community",
                          style: TextStyle(
                              fontFamily: "sans-serif",
                              fontSize: 20.0,
                              color: Colors.black,
                              fontStyle: FontStyle.italic),
                        ))
                  ],
                ),
                new Spacer(flex:25)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
