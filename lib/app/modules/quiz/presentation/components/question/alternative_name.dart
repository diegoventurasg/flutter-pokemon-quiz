import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entities/alternative_entity.dart';
import '../../controllers/quiz_controller.dart';

class AlternativeName extends StatelessWidget {
  AlternativeName({
    Key? key,
    required this.alternative,
  }) : super(key: key);

  final AlternativeEntity alternative;
  final QuizController quizController = Modular.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        child: Text(alternative.alternative.name),
        onPressed: () {
          quizController.checkAnswer(alternative);
        },
      ),
    );
  }
}
