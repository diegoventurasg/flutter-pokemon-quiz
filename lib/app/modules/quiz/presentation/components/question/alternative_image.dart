import 'package:flutter/material.dart';

import '../../../domain/entities/alternative_entity.dart';

class AlternativeImage extends StatelessWidget {
  const AlternativeImage({
    Key? key,
    required this.alternative,
  }) : super(key: key);

  final AlternativeEntity alternative;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        child: Image.network(alternative.alternative.image),
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
