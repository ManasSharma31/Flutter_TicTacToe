import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok/Screens/HomeScreen.dart';
import 'package:tik_tok/constants/playerboard.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: 30),
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[850],
                          offset: Offset(5.0, 5.0),
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                        ),
                        BoxShadow(
                          color: Colors.grey[900],
                          offset: Offset(-10.0, -10.0),
                          blurRadius: 15.0,
                          spreadRadius: 2.0,
                        )
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey[800],
                            Colors.grey[700],
                            Colors.grey[600],
                            Colors.grey[600],
                          ])),
                  child: Text("TIC TAC TOE", style: kplayerboard),
                ),
              ),
            ),
            AvatarGlow(
              endRadius: 210,
              duration: Duration(seconds: 3),
              startDelay: Duration(seconds: 1),
              repeat: true,
              // repeatPauseDuration: Duration(seconds: 1),
              glowColor: Colors.white,
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(style: BorderStyle.none),
                    image: DecorationImage(
                      image: AssetImage('images/download.jpg'),
                    )),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Test Your Skills",
                  style: kplayerboard,
                ),
                //SizedBox(height: 20.0),
                Material(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  elevation: 5.0,
                  color: Colors.white,
                  child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      "Play",
                      style: kplayerboard,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
