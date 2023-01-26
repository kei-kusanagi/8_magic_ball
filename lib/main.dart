import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
            title: const Center(
              child: Text('Ask Me every thing'),
            ),
            backgroundColor: Colors.black),
        body: const Ball(),
      ),
    ),
  );
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  _BallState createState() => _BallState();
}

int ballNumber = 1;

void randomNumber() {
  ballNumber = Random().nextInt(5) + 1;
}

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                setState(
                  () {
                    randomNumber();
                  },
                );
              },
              child: Image.asset('images/ball$ballNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
