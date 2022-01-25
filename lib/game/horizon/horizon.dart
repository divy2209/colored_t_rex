import 'package:colored_t_rex/game/game.dart';
import 'package:colored_t_rex/game/horizon/horizon_line.dart';
import 'package:flame/components.dart';

class Horizon extends PositionComponent with HasGameRef<TRexGame> {
  late final horizonLine = HorizonLine();

  @override
  Future<void>? onLoad() {
    addChild(horizonLine);
  }

  @override
  void update(double dt){
    y = (gameRef.size.y/2)+21.0;
    super.update(dt);
  }

  void reset() {
    horizonLine.reset();
  }
}