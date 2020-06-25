import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Text('NiceDice'),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: JDice(),
      ),
    ));

class JDice extends StatefulWidget {
  @override
  _JDiceState createState() => _JDiceState();
}

class _JDiceState extends State<JDice> {
  int DUpLef = 1;
  int DUpRi = 1;
  int DLoLef = 1;
  int DLoRi = 1;
  int DCen = 1;

  void randomizeDice(){
    setState(() {
      DUpLef = Random().nextInt(6) + 1;
      DUpRi = Random().nextInt(6) + 1;
      DLoLef = Random().nextInt(6) + 1;
      DLoRi = Random().nextInt(6) + 1;
      DCen = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: randomizeDice,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/dice$DUpLef.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: randomizeDice,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/dice$DUpRi.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                    onPressed: randomizeDice,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('images/dice$DLoLef.png'),
                      ),
                    ),
                  )),
              Expanded(
                child: FlatButton(
                  onPressed: randomizeDice,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/dice$DLoRi.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: randomizeDice,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/dice$DCen.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
