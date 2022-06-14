import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../quiz_helper.dart';
import '../components/question/question.dart';
import '../components/quiz_bar/quiz_bar.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizHelper quiz = Modular.get<QuizHelper>();

  @override
  void initState() {
    super.initState();
    quiz.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: quiz.controller.init(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  QuizBar(),
                  Question(),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
