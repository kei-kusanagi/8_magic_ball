import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';


void main() {
  Animate.restartOnHotReload = true;
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black38,
        appBar: AppBar(
            title: const Center(
              child: Text('Ask Me every thing'),
            ),
            backgroundColor: Colors.blue.shade800,
        ),
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
  bool _bool = false;

  void _changeImage() {
    setState(() {
      _bool = !_bool;
      randomNumber();
    });
  }
  void _shake_image(){
    setState(() {
      // animate().shake();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(

        children: <Widget>[
          Expanded(
            child: GestureDetector(

              onTap: (){
                _changeImage();
              },
                child: Stack(
                   children: <Widget>[
                     Image.asset('images/sombra.png')
                      .animate(target: _bool ? 1 : 0)

                      .scaleXY(end: 1.5)
                      .scaleXY(end: 1 / 1.5),
                     Image.asset('images/eight_ball$ballNumber.png')
                      .animate(target: _bool ? 1 : 0)
                      .shake(duration: 300.milliseconds, hz: 2)
                      .scaleXY(end: 1.5)
                      .scaleXY(end: 1 / 1.5),
                   ],
                ),

            ),

            // child: GestureDetector(
            //   onTap: _changeImage,
            //
            //   child: Stack(
            //     // mainAxisAlignment: MainAxisAlignment.center,
            //     // children: <Widget>[
            //     //   Visibility(
            //     //     visible: _bool,
            //     //     child: Image.asset('images/ball$ballNumber.png'),
            //     //   ),
            //     //   Visibility(
            //     //     visible: !_bool,
            //     //     child: Image.asset('images/fondo.png'),
            //     //   ),
            //     // ],
            //     children: [
            //       Expanded(
            //         child: Image.asset('images/fondo.png').animate().fadeOut().slide().shake(),
            //       ),
            //     Expanded(
            //       child: AnimatedCrossFade(
            //
            //       firstChild: Image.asset('images/ball$ballNumber.png'),
            //       secondChild: Image.asset('images/ball$ballNumber.png'),
            //       // firstCurve: Curves.bounceIn,
            //
            //
            //       crossFadeState: _bool ? CrossFadeState.showFirst: CrossFadeState.showSecond,
            //       duration: const Duration(seconds:2),
            //         ),
            //     ),
            //     ],
            //
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}