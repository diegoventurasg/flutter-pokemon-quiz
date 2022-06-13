import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/consts/api_const.dart';
import '../../../domain/entities/alternative_entity.dart';
import '../../../domain/entities/question_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../../stores/question_store.dart';

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
              return SizedBox(
                width: 400,
                child: Column(
                  children: [
                    Image.network(
                      ApiConst.imgUrl(question.question.num),
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(height: 16),
                    ...question.alternatives.map((e) => _alternative(e)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _alternative(AlternativeEntity alternative) {
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
