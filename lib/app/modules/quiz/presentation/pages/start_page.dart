import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/quiz/game'),
              child: const Text('Começar'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/quiz/ranking'),
              child: const Text('Ranking'),
            ),
          ],
        ),
      ),
    );
  }
}
