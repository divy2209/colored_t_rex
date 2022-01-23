import 'dart:ui';

import 'package:flame/components.dart';

import '../game.dart';

enum TRexStatus {crashed, ducking, jumping, running, waiting, intro}

class TRex extends PositionComponent with HasGameRef<TRexGame>{
  
}