import 'package:colored_t_rex/game/game.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameWrapper extends StatefulWidget {
  const GameWrapper({Key? key}) : super(key: key);

  @override
  _GameWrapperState createState() => _GameWrapperState();
}

class _GameWrapperState extends State<GameWrapper> {
  //bool splashGone = false;
  TRexGame? game;
  final _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startGame();
  }

  void startGame(){
    Flame.images.loadAll(["sprite.png"]).then(
        (image)=> {
          setState((){
            game = TRexGame(spriteImage: image[0]);
            _focusNode.requestFocus();
          })
        },
    );
  }

  void onRawKeyEvent(RawKeyEvent event){
    if(event.logicalKey == LogicalKeyboardKey.enter ||
       event.logicalKey == LogicalKeyboardKey.space){
      game!.onAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(game==null){
      return const Center(
        child: Text("Loading"),
      );
    }
    return Container(
      color: Colors.white,
      constraints: const BoxConstraints.expand(),
      child: RawKeyboardListener(
        focusNode: _focusNode,
        onKey: onRawKeyEvent,
        child: GameWidget(
          game: game!,
        ),
      ),
    );
  }
}
