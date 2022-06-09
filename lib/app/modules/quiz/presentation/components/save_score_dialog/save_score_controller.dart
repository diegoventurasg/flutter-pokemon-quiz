import 'package:flutter/cupertino.dart';

import '../../../domain/entities/score_entity.dart';
import 'save_score_store.dart';

class SaveScoreController {
  SaveScoreController(this.store);

  final SaveScoreStore store;
  final TextEditingController nameController = TextEditingController(text: '');

  bool validate({required String name}) {
    return name.isNotEmpty;
  }

  Future<bool> save({required String name, required int points}) async {
    if (validate(name: name)) {
      await store.save(ScoreEntity(playerName: name, points: points));
      return true;
    } else {
      return false;
    }
  }
}
