import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> txtSizeAnimation;
  late final Animation<double> imgSizeAnimation;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Modular.to.navigate('/quiz/'),
    );

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    txtSizeAnimation = Tween<double>(begin: 0, end: 40)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    imgSizeAnimation = Tween<double>(begin: 100.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.colors.primary,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Pokémon Quiz',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: txtSizeAnimation.value,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/splash.png',
                height: imgSizeAnimation.value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
