import 'package:flutter_triple/flutter_triple.dart';

class SelectedAlternativeStore extends StreamStore<Exception, int> {
  SelectedAlternativeStore() : super(-1);

  void setAlternativeIndex(int value) {
    update(value);
  }
}
