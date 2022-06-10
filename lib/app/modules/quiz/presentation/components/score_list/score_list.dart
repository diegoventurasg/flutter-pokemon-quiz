import 'package:flutter/material.dart';

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
    return ListTile(
      title: Text(list[index].playerName),
      trailing: Text(list[index].points.toString()),
    );
  }
}
