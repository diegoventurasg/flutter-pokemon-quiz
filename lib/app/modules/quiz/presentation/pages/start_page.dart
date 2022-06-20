import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/theme/app_theme.dart';
import '../button/button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.colors.background,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(
              title: 'Começar',
              onPressed: () => Modular.to.navigate('/quiz/game'),
              type: ButtonType.big,
            ),
            const SizedBox(height: 16),
            Button(
              title: 'Ranking',
              onPressed: () => Modular.to.pushNamed('/quiz/ranking'),
              type: ButtonType.big,
            ),
          ],
        ),
      ),
    );
  }
}
