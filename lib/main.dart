import 'package:flutter/material.dart';
import 'dart:math'; //generates random numbers

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftBtnNum = 1;
  int rightBtnNum = 1;

  void rollDice() {
    setState(() {
      leftBtnNum = Random().nextInt(6) + 1;
      rightBtnNum = Random().nextInt(6) + 1;
      // the + 1 prevents it from landing on 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                rollDice();
              },
              child: Image(
                image: AssetImage('images/dice$leftBtnNum.png'),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
                onPressed: (){
                  rollDice();
                },
                child: Image(
                  image: AssetImage('images/dice$rightBtnNum.png'),
                )
            ),
          ),
        ],
      ),
    );
  }
}
