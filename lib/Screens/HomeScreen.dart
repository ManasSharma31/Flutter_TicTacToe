import 'package:flutter/material.dart';
import 'package:tik_tok/constants/playerboard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> oorx = ["", "", "", "", "", "", "", "", ""];
  int zeroScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool turn = true;

  void winner() {
    if (oorx[0] == oorx[1] && oorx[0] == oorx[2] && oorx[0] != "")
      showdialog(oorx[0]);
    else if (oorx[3] == oorx[4] && oorx[3] == oorx[5] && oorx[3] != "")
      showdialog(oorx[3]);
    else if (oorx[6] == oorx[7] && oorx[6] == oorx[8] && oorx[6] != "")
      showdialog(oorx[6]);
    else if (oorx[0] == oorx[3] && oorx[0] == oorx[5] && oorx[0] != "")
      showdialog(oorx[0]);
    else if (oorx[1] == oorx[4] && oorx[1] == oorx[7] && oorx[1] != "")
      showdialog(oorx[1]);
    else if (oorx[2] == oorx[5] && oorx[2] == oorx[8] && oorx[2] != "")
      showdialog(oorx[2]);
    else if (oorx[0] == oorx[4] && oorx[4] == oorx[8] && oorx[0] != "")
      showdialog(oorx[0]);
    else if (oorx[2] == oorx[4] && oorx[4] == oorx[6] && oorx[2] != "")
      showdialog(oorx[2]);
    else if (filledBoxes == 9) showdrawdialog();
  }

  void showdrawdialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: <Widget>[
              FlatButton(
                child: Text("Play Again"),
                onPressed: () {
                  setState(() {
                    clearDashBoard();
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
  }

  void clearDashBoard() {
    for (int i = 0; i < 9; i++) {
      oorx[i] = "";
    }
    filledBoxes = 0;
  }

  void _tapped(int index) {
    setState(() {
      if (turn && oorx[index] == '') {
        oorx[index] = 'O';
        filledBoxes++;
        turn = !turn;
      } else if (!turn && oorx[index] == '') {
        oorx[index] = 'X';
        filledBoxes++;
        turn = !turn;
      }

      winner();
    });
  }

  void showdialog(String winner) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5.0,
            contentPadding: EdgeInsets.all(10.0),
            backgroundColor: Colors.grey[800],
            titleTextStyle: TextStyle(fontFamily: "Pirata", fontSize: 30.0),
            title: Text("Winner is " + winner),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Play Again",
                ),
                onPressed: () {
                  setState(() {
                    clearDashBoard();
                    Navigator.pop(context);
                  });
                },
              )
            ],
          );
        });
    winner == "O" ? zeroScore++ : xScore++;
    winner == "O" ? turn = false : turn = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: EdgeInsets.only(left: 10, top: 20, right: 10),
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Player X", style: kplayerboard),
                        Text(xScore.toString(), style: kplayerboard)
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Player O", style: kplayerboard),
                        Text(zeroScore.toString(), style: kplayerboard)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Material(
                      elevation: 5.0,
                      color: Colors.grey[800],
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[700])),
                        child: Center(
                            child: Text(oorx[index], style: kplayerboard)),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child:
                        Center(child: Text("TIC TAC TOE", style: kplayerboard)),
                  ),
                  Container(
                    child: Center(
                        child: Text("By Manas Sharma", style: kplayerboard)),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
