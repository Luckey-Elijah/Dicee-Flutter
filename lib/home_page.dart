import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<int> _previousRolls = List<int>();

class _MyHomePageState extends State<MyHomePage> {
  int _leftDice = 1;
  int _rightDice = 1;

  void _addValueToList(int value) {
    if (_previousRolls.length > 9) {
      _previousRolls.removeAt(0);
    }
    _previousRolls.add(_leftDice + _rightDice);
    print(_previousRolls);
  }

  int _randomDiceValue(int numSides) {
    return Random().nextInt(numSides) + 1;
  }

  int _rollBothDice() {
    _leftDice = _randomDiceValue(6);
    _rightDice = _randomDiceValue(6);
    return _leftDice + _rightDice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actionsIconTheme: IconThemeData(color: Colors.amber),
        iconTheme: IconThemeData(),
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
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
            style: TextStyle(fontSize: 55.0),
          ),
          Text('${_previousRolls.toString()}'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          setState(() {
            _addValueToList(_rollBothDice());
          });
        },
        tooltip: 'Roll',
        child: Icon(Icons.card_membership),
      ),
    );
  }
}

// In Progess list builder for previos rolls
class PreviousRollList extends StatelessWidget {
  const PreviousRollList({Key key}) : super(key: key);
  Widget _previosRollListItem(BuildContext context, int index) {
    final value = _previousRolls[index];
    return ListTile(
      contentPadding: EdgeInsets.all(4.0),
      dense: true,
      title: Text('$value'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _previosRollListItem,
      itemCount: _previousRolls.length,
    );
  }
}
