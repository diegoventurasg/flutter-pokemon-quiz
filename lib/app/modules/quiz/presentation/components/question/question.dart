import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/consts/api_const.dart';
import '../../../domain/entities/question_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../../stores/question_store.dart';
import '../save_score_dialog/save_score_dialog.dart';

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
                    ...question.alternatives.map(
                      (alternative) => Container(
                        width: 350,
                        height: 45,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ElevatedButton(
                          child: Text(alternative.alternative.name),
                          onPressed: () async {
                            bool next =
                                await controller.checkAnswer(alternative);
                            if (!next) {
                              //game over
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => SaveScoreDialog(
                                  points: controller.scoreStore.state,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
