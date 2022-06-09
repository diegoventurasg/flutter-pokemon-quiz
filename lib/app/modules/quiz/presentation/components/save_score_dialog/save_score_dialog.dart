import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/quiz_controller.dart';
import '../../stores/game_over_store.dart';
import 'save_score_controller.dart';

class SaveScoreDialog extends StatefulWidget {
  const SaveScoreDialog({
    Key? key,
    required this.quizController,
  }) : super(key: key);

  final QuizController quizController;

  @override
  State<SaveScoreDialog> createState() => _SaveScoreDialogState();
}

class _SaveScoreDialogState extends State<SaveScoreDialog> {
  final SaveScoreController controller = Modular.get<SaveScoreController>();

  @override
  void initState() {
    super.initState();
    controller.store.observer(
      onState: (state) {
        Modular.to.navigate('/quiz/');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<GameOverStore, Exception, bool>(
        store: widget.quizController.gameOverStore,
        builder: (context, triple) {
          if (triple.state) {
            return Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.transparent,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  // quizController.clearQuiz();
                                  Modular.to.navigate('/quiz/');
                                },
                                child: const FaIcon(
                                  FontAwesomeIcons.xmark,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Informe um nome para salvar a sua pontuação',
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: controller.nameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (name) {
                              if (name == null || name.trim().isEmpty) {
                                return 'Informe um nome';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              controller.save(
                                name: controller.nameController.text,
                                points: widget.quizController.scoreStore.state,
                              );
                            },
                            child: const Text('CONTINUAR'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
