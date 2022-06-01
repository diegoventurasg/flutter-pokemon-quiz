import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/question_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../../stores/question_store.dart';
import 'question_image.dart';
import 'question_name.dart';

class Question extends StatelessWidget {
  Question({Key? key}) : super(key: key);

  final QuizController controller = Modular.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScopedBuilder<QuestionStore, Exception, QuestionEntity>(
            store: controller.questionStore,
            onLoading: (_) => const Center(child: CircularProgressIndicator()),
            onError: (_, exception) => const Center(child: Text('error')),
            onState: (_, question) {
              return _question(question);
            },
          ),
        ],
      ),
    );
  }

  Widget _question(QuestionEntity question) {
    if (question.question.name.isEmpty || question.question.image.isEmpty) {
      return Container();
    }

    switch (question.type) {
      case QuestionType.image:
        return QuestionImage(question: question);
      case QuestionType.name:
        return QuestionName(question: question);
      default:
        return Container();
    }
  }
}
