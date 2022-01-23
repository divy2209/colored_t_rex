import 'package:colored_t_rex/game_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  //await Flame.device.fullScreen();
  runApp(
    const MaterialApp(
      title: "ColouredTRexGame",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: GameWrapper(),
      ),
    )
  );
}