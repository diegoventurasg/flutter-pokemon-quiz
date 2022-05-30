import 'package:flutter/material.dart';

import '../../../domain/entities/question_entity.dart';
import 'alternative_image.dart';

class QuestionName extends StatelessWidget {
  const QuestionName({
    Key? key,
    required this.question,
  }) : super(key: key);

  final QuestionEntity question;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: question.question.name.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Text(question.question.name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlternativeImage(alternative: question.alternative1),
                    AlternativeImage(alternative: question.alternative2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlternativeImage(alternative: question.alternative3),
                    AlternativeImage(alternative: question.alternative4),
                  ],
                ),
              ],
            ),
    );
  }
}
