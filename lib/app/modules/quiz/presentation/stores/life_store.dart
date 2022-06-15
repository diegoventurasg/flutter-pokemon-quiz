import 'package:flutter_triple/flutter_triple.dart';

class LifeStore extends StreamStore<Exception, int> {
  LifeStore() : super(3);

  void decrement() {
    update(state - 1);
  }

  void init() {
    update(3);
  }
}
