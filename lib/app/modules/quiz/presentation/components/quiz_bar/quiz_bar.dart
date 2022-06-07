import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/quiz_controller.dart';
import '../../stores/life_store.dart';
import '../../stores/score_store.dart';

class QuizBar extends StatelessWidget {
  const QuizBar({
    Key? key,
    required this.quizController,
  }) : super(key: key);

  final QuizController quizController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 65,
      width: double.maxFinite,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () async {
              final result = await showDialog<bool>(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Sair'),
                        content: const Text(
                            'Deseja sair? A sua pontuação será perdida.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Confirmar'),
                          ),
                        ],
                      ));
              if (result ?? false) {
                // quizController.clearQuiz();
                Modular.to.navigate('/quiz/');
              }
            },
            child: const FaIcon(
              FontAwesomeIcons.xmark,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            width: 120,
            child: TripleBuilder<LifeStore, Exception, int>(
                store: quizController.lifeStore,
                builder: (context, triple) {
                  return Row(
                    children: [
                      for (int i = 0; i < triple.state; i++)
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: FaIcon(
                            FontAwesomeIcons.solidHeart,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                    ],
                  );
                }),
          ),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.solidThumbsUp,
                color: Colors.yellow,
                size: 30,
              ),
              const SizedBox(width: 5),
              TripleBuilder<ScoreStore, Exception, int>(
                store: quizController.scoreStore,
                builder: (context, triple) => Text(
                  triple.state.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
