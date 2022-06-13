import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../components/question/question.dart';
import '../components/quiz_bar/quiz_bar.dart';
import '../controllers/quiz_controller.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizController controller = Modular.get<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: controller.init(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  QuizBar(quizController: controller),
                  Question(quizController: controller),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
