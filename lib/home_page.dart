import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _leftDice = 6;
  int _rightDice = 1;

  int _randomDiceValue(int numSides) {
    return Random().nextInt(numSides) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                    child: Image.asset('images/dice$_leftDice.png'),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
                    child: Image.asset('images/dice$_rightDice.png'),
                  ),
                ),
              ],
            ),
            Text(
              'You rolled ${_leftDice + _rightDice}!',
              style: TextStyle(fontSize: 60.0),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          setState(() {
            _leftDice = _randomDiceValue(6);
            _rightDice = _randomDiceValue(6);
          });
        },
        tooltip: 'Roll',
        child: Icon(Icons.card_membership),
      ),
    );
  }
}
