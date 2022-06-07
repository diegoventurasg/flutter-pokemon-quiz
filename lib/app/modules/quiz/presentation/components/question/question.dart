import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/alternative_entity.dart';
import '../../../domain/entities/question_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../../stores/question_store.dart';
import '../quiz_image/quiz_image.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.quizController,
  }) : super(key: key);

  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScopedBuilder<QuestionStore, Exception, QuestionEntity>(
            store: quizController.questionStore,
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
        return _questionImage(question);
      case QuestionType.name:
        return _questionName(question);
      default:
        return Container();
    }
  }

  Widget _questionImage(QuestionEntity question) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          QuizImage(
            question.question.image,
            height: 150,
          ),
          _alternativeName(question.alternative1),
          _alternativeName(question.alternative2),
          _alternativeName(question.alternative3),
          _alternativeName(question.alternative4),
        ],
      ),
    );
  }

  Widget _questionName(QuestionEntity question) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Text(
            question.question.name,
            style: const TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _alternativeImage(question.alternative1),
              _alternativeImage(question.alternative2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _alternativeImage(question.alternative3),
              _alternativeImage(question.alternative4),
            ],
          ),
        ],
      ),
    );
  }

  Widget _alternativeName(AlternativeEntity alternative) {
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

  Widget _alternativeImage(AlternativeEntity alternative) {
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
