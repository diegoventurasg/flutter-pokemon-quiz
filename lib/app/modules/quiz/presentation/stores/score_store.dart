import 'package:flutter_triple/flutter_triple.dart';

class ScoreStore extends StreamStore<Exception, int> {
  ScoreStore() : super(0);

  void increment() {
    update(state + 1);
  }
}
