import 'package:flutter/material.dart';
import 'DiceRoller.dart';

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

String diceStatus = 'ROLLEM';

class _JDiceState extends State<JDice> {
  DiceRoller diceRoller = DiceRoller();

  @override
  Widget build(BuildContext context) {
    void update() {
      setState(() {
        diceStatus = diceRoller.randomizeDice();
      });
    }

    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$diceStatus',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  onPressed: update,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/dice${diceRoller.dUpLef}.png'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: update,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/dice${diceRoller.dUpRi}.png'),
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
                onPressed: update,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage('images/dice${diceRoller.dLoLef}.png'),
                  ),
                ),
              )),
              Expanded(
                child: FlatButton(
                  onPressed: update,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage('images/dice${diceRoller.dLoRi}.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: update,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/dice${diceRoller.dCen}.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
