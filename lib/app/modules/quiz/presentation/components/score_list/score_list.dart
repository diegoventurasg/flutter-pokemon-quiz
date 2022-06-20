import 'package:flutter/material.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../domain/entities/score_entity.dart';

class ScoreList extends StatelessWidget {
  const ScoreList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<ScoreEntity> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: _itemBuilder,
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          list[index].playerName,
          style: _style(index),
        ),
        leading: Text(
          (index + 1).toString(),
          style: _style(index),
          textAlign: TextAlign.center,
        ),
        trailing: Text(
          list[index].points.toString(),
          style: _style(index),
        ),
      ),
    );
  }

  TextStyle _style(int index) {
    switch (index) {
      case 0:
        return AppTheme.textStyles.first;
      case 1:
        return AppTheme.textStyles.second;
      case 2:
        return AppTheme.textStyles.third;
      default:
        return AppTheme.textStyles.listItem;
    }
  }
}
