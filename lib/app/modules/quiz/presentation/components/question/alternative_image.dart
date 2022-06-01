import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/alternative_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../quiz_image/quiz_image.dart';

class AlternativeImage extends StatelessWidget {
  AlternativeImage({
    Key? key,
    required this.alternative,
  }) : super(key: key);

  final AlternativeEntity alternative;
  final QuizController quizController = Modular.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        child: QuizImage(alternative.alternative.image),
        onPressed: () {
          quizController.checkAnswer(alternative);
        },
      ),
    );
  }
}
