import 'package:flutter/material.dart';

import '../../../domain/entities/question_entity.dart';
import '../quiz_image/quiz_image.dart';
import 'alternative_name.dart';

class QuestionImage extends StatelessWidget {
  const QuestionImage({
    Key? key,
    required this.question,
  }) : super(key: key);

  final QuestionEntity question;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        children: [
          QuizImage(
            question.question.image,
            height: 150,
          ),
          AlternativeName(alternative: question.alternative1),
          AlternativeName(alternative: question.alternative2),
          AlternativeName(alternative: question.alternative3),
          AlternativeName(alternative: question.alternative4),
        ],
      ),
    );
  }
}
