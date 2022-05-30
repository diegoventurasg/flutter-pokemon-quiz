import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/question_entity.dart';
import '../components/question/question_image.dart';
import '../components/question/question_name.dart';
import '../controllers/quiz_controller.dart';
import '../stores/question_store.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizController controller = Modular.get<QuizController>();

  @override
  void initState() {
    super.initState();
    controller.questionStore.observer(
      onError: (error) => print(error),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.generateQuestion(),
        child: const Icon(Icons.refresh),
      ),
      body: ScopedBuilder<QuestionStore, Exception, QuestionEntity>(
        store: controller.questionStore,
        onLoading: (_) => const Center(child: CircularProgressIndicator()),
        onError: (_, exception) => const Center(child: Text('error')),
        onState: (_, question) {
          switch (question.type) {
            case QuestionType.image:
              return QuestionImage(question: question);
            case QuestionType.name:
              return QuestionName(question: question);
            default:
              return Container();
          }
        },
      ),
    );
  }
}
