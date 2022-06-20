import 'package:flutter/material.dart';

import 'app_theme.dart';

abstract class IAppTextStyles {
  TextStyle get button;
  TextStyle get listItem;
  TextStyle get ranking;
  TextStyle get title;
  TextStyle get text;
  TextStyle get first;
  TextStyle get second;
  TextStyle get third;
}

class AppTextStyles implements IAppTextStyles {
  @override
  TextStyle get button => TextStyle(
        fontSize: 22,
        color: AppTheme.colors.text,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get listItem => TextStyle(
        fontSize: 22,
        color: AppTheme.colors.text,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get ranking => TextStyle(
        fontSize: 20,
        color: AppTheme.colors.text,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get title => TextStyle(
        fontSize: 28,
        color: AppTheme.colors.text,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get text => TextStyle(
        fontSize: 16,
        color: AppTheme.colors.text,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get first => listItem.copyWith(color: AppTheme.colors.first);

  @override
  TextStyle get second => listItem.copyWith(color: AppTheme.colors.second);

  @override
  TextStyle get third => listItem.copyWith(color: AppTheme.colors.third);
}
