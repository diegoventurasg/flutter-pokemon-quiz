import 'package:flutter/material.dart';

class QuizImage extends StatelessWidget {
  const QuizImage(
    this.src, {
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  final String src;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      height: height,
      width: width,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress == null
            ? child
            : const Center(
                child: Text(
                'Carregando...',
                style: TextStyle(color: Colors.white),
              ));
      },
      errorBuilder: (context, exception, stackTrace) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}
