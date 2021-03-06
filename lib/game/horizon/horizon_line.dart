import 'package:colored_t_rex/game/game.dart';
import 'package:colored_t_rex/game/horizon/clouds.dart';
import 'package:colored_t_rex/game/horizon/config.dart';
import 'package:colored_t_rex/game/obstacle/obstacle.dart';
import 'package:flame/components.dart';

class HorizonLine extends PositionComponent with HasGameRef<TRexGame> {
  late final dimensions = HorizonDimensions();
  
  late final _softSprite = Sprite(
    gameRef.spriteImage,
    srcPosition: Vector2(2.0, 104.0),
    srcSize: Vector2(dimensions.width, dimensions.height)
  );
  
  late final _bumpySprite = Sprite(
    gameRef.spriteImage,
    srcPosition: Vector2(2.0+dimensions.width, 104.0),
    srcSize: Vector2(dimensions.width, dimensions.height)
  );
  
  late final firstGround = HorizonGround(_softSprite, dimensions);
  late final secondGround = HorizonGround(_bumpySprite, dimensions);
  late final thirdGround = HorizonGround(_softSprite, dimensions);

  late final CloudManager cloudManager = CloudManager(horizonConfig: HorizonConfig());
  late final ObstacleManager obstacleManager = ObstacleManager(dimensions);

  @override
  void onMount() {
    addChild(firstGround);
    addChild(secondGround);
    addChild(thirdGround);
    addChild(cloudManager);
    addChild(obstacleManager);
    super.onMount();
  }

  void updateXPos(int indexFirst, double increment){
    final grounds = [firstGround, secondGround, thirdGround];

    final first = grounds[indexFirst];
    final second = grounds[(indexFirst+1)%3];
    final third = grounds[(indexFirst+2)%3];

    first.x -= increment;
    second.x = first.x+dimensions.width;
    third.x = second.x+dimensions.width;

    if(first.x <= -dimensions.width) {
      first.x += dimensions.width*3;
    }
  }

  @override
  void update(double dt){
    super.update(dt);
    final increment = gameRef.currentSpeed*50*dt;
    final index = firstGround.x<=0 ? 0 : (secondGround.x <=0 ? 1 : 2);
    updateXPos(index, increment);
  }

  void reset() {
    cloudManager.reset();
    obstacleManager.reset();
    firstGround.x=0.0;
    secondGround.x=dimensions.width;
  }
}

class HorizonGround extends SpriteComponent {
  HorizonGround(Sprite sprite, HorizonDimensions dimensions)
      : super(
          size: Vector2(dimensions.width, dimensions.height),
          sprite: sprite    
  );
}