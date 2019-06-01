
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trex/game/game.dart';
import 'package:trex/splashScreen.dart';
import 'dart:io';
import 'dart:ui' as ui;

void main() async {
  Flame.audio.disableLog();
  List<ui.Image> image = await Flame.images.loadAll(["sprite2.png"]);
  TRexGame tRexGame = TRexGame(spriteImage: image[0]);
  runApp(MaterialApp(
    title: 'TRexGame',
    home: new SplashScreen(),
    routes: <String, WidgetBuilder> {
      '/HomeScreen': (BuildContext context) => new Menu(tRexGame)

    }

  ));

  Flame.util.addGestureRecognizer(new TapGestureRecognizer()
    ..onTapDown = (TapDownDetails evt) => tRexGame.onTap());

  SystemChrome.setEnabledSystemUIOverlays([]);
}

class Menu extends StatelessWidget {
  
  TRexGame tRexGame ;

  Menu(TRexGame tRexGame) {
    this.tRexGame = tRexGame;
  }



    @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Home page",
        )),
        body: Center(
          child: Center(
            child: Column(
              children: <Widget>[
                Spacer(flex: 5),
                Container(
                  decoration: new BoxDecoration(),
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Text(
                    "Welcome to flutter fly!",
                    style: new TextStyle(
                        fontStyle: FontStyle.italic, fontSize: 45),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(
                      color: Colors.blueAccent,
                      width: 1.0,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                  child: Text(
                    "Flutter Fly is a grid-based game that helps u with learning about Flutter! tap on the start button to be taken to the start menu and then tap again to run the game!",
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(
                  flex: 5,
                ),
                RaisedButton(
                    child: Text("Start Game"),
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      print("hello");
                  
                      Navigator.push(
                    context,
                  MaterialPageRoute(builder: (context) => GameWrapper(tRexGame)),
                  );
                    }),
                Spacer(flex: 3),
                RaisedButton(
                  child: new Icon(Icons.close),
                  color: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () => exit(0),
                ),
                Spacer(
                  flex: 10,
                ),
              ],
            ),
          ),
        ));
  }

}


class GameWrapper extends StatelessWidget {
  final TRexGame tRexGame;
  GameWrapper(this.tRexGame);

  @override
  Widget build(BuildContext context) {
    return tRexGame.widget;
  }
}
