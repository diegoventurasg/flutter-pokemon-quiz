import 'package:flutter_triple/flutter_triple.dart';

class GameOverStore extends StreamStore<Exception, bool> {
  GameOverStore() : super(false);

  void setGameOver() {
    update(true);
  }

  void reset() {
    update(false);
  }
}
