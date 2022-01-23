import 'dart:ui' as ui;
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';

import 'game_config.dart';

class TRexGame extends BaseGame with TapDetector{
  TRexGame({
    required this.spriteImage
  }) : super();
  final ui.Image spriteImage;
  
  late final config = GameConfig();
  
  @override
  ui.Color backgroundColor() => const ui.Color(0xFFFFFFFF);

  late final tRex = Trex();
  late final horizon = Horizon();
  late final gameOverPanel = GameOverPanel(spriteImage, GameOverConfig());

  void onAction() {
    if(gameOver){
      restart();
      return;
    }
    tRex.startJump(currentSpeed);
  }
}