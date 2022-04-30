import 'dart:async';

import 'package:flame/input.dart';
import 'package:pinball_components/pinball_components.dart';
import 'package:pinball_flame/pinball_flame.dart';
import 'package:sandbox/stories/ball/basic_ball_game.dart';

class AndroidSpaceshipGame extends BallGame {
  AndroidSpaceshipGame()
      : super(
          ballPriority: RenderPriority.ballOnSpaceship,
          ballLayer: Layer.spaceship,
          imagesFileNames: [
            Assets.images.android.spaceship.saucer.keyName,
            Assets.images.android.spaceship.animatronic.keyName,
            Assets.images.android.spaceship.lightBeam.keyName,
          ],
        );

  static const description = '''
    Shows how the AndroidSpaceship is rendered.

    - Activate the "trace" parameter to overlay the body.
    - Tap anywhere on the screen to spawn a Ball into the game.
''';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    camera.followVector2(Vector2.zero());
    await addFromBlueprint(
      AndroidSpaceship(position: Vector2.zero()),
    );

    await traceAllBodies();
  }
}