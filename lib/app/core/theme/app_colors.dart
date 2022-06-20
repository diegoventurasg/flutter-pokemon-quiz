import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get primary;
  Color get text;
  Color get background;
  Color get first;
  Color get second;
  Color get third;
  Color get alternative;
  Color get correct;
  Color get wrong;
}

class AppColors implements IAppColors {
  @override
  Color get primary => const Color(0xFF1E88E5);

  @override
  Color get text => const Color(0XFFFFFFFF);

  @override
  Color get background => const Color(0XFF141C24);

  @override
  Color get first => const Color(0xFFF6C346);

  @override
  Color get second => const Color(0xFFB2B2B2);

  @override
  Color get third => const Color(0xFFD58462);

  @override
  Color get alternative => const Color(0xFF1Cb0F6);

  @override
  Color get correct => const Color(0xFF7AC70C);

  @override
  Color get wrong => const Color(0xFFD33131);
}
