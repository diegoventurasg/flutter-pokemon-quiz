import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../domain/entities/alternative_entity.dart';
import '../../controllers/quiz_controller.dart';
import '../../stores/selected_alternative_store.dart';
import '../save_score_dialog/save_score_dialog.dart';

class Alternative extends StatefulWidget {
  const Alternative({
    Key? key,
    required this.alternative,
    required this.index,
  }) : super(key: key);

  final AlternativeEntity alternative;
  final int index;

  @override
  State<Alternative> createState() => _AlternativeState();
}

class _AlternativeState extends State<Alternative> {
  final QuizController quizController = Modular.get<QuizController>();
  bool isSelected = false;

  Future<void> _handleClickAlternative(
    BuildContext context,
    AlternativeEntity alternative,
  ) async {
    isSelected = true;
    await quizController.checkAnswer(alternative.isCorrect, widget.index);
    bool isGameOver = !await quizController.generateQuestion();
    if (isGameOver) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) =>
            SaveScoreDialog(points: quizController.scoreStore.state),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<SelectedAlternativeStore, Exception, int>(
      store: quizController.selectedAlternativeStore,
      builder: (context, triple) {
        int selectedAlternative = triple.state;

        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: selectedAlternative == -1
                ? () => _handleClickAlternative(context, widget.alternative)
                : null,
            child: Container(
              width: 350,
              height: 40,
              decoration: _getDecoration(selectedAlternative),
              child: Center(
                child: Text(
                  widget.alternative.alternative.name,
                  style: AppTheme.textStyles.text,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Decoration _getDecoration(int selectedAlternative) {
    if (selectedAlternative == -1 || !isSelected) {
      //decoration when not clicked yet or is not the selected alternative
      return BoxDecoration(
        color: AppTheme.colors.alternative,
        borderRadius: BorderRadius.circular(10),
      );
    } else {
      //decoration when clicked
      //correct or wrong color
      return BoxDecoration(
        color: (widget.alternative.isCorrect
            ? AppTheme.colors.correct
            : AppTheme.colors.wrong),
        borderRadius: BorderRadius.circular(10),
      );
    }
  }
}
