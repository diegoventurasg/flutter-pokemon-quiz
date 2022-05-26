import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Modular.to.navigate('/quiz/'),
    );

    return const Material(
      child: Center(
        child: Text('Splash'),
      ),
    );
  }
}
