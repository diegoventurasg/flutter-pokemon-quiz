import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/quiz_controller.dart';

class QuizHelper {
  QuizHelper();

  QuizController? _controller;

  void init() {
    _controller = Modular.get<QuizController>();
  }

  QuizController get controller => _controller!;
}
