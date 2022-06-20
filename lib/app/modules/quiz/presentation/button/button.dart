import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

enum ButtonType { normal, big }

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.title,
    required this.onPressed,
    this.type = ButtonType.normal,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: type == ButtonType.big ? 250 : null,
      height: type == ButtonType.big ? 45 : null,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: type == ButtonType.big
              ? AppTheme.textStyles.button
              : AppTheme.textStyles.text,
        ),
      ),
    );
  }
}
