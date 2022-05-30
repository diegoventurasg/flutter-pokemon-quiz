import 'package:flutter/material.dart';

import '../../../domain/entities/alternative_entity.dart';

class AlternativeName extends StatelessWidget {
  const AlternativeName({
    Key? key,
    required this.alternative,
  }) : super(key: key);

  final AlternativeEntity alternative;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        child: Text(alternative.alternative.name),
        onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(alternative.isCorrect ? 'correct' : 'incorrect'),
            ),
          );
        },
      ),
    );
  }
}
