import 'dart:convert';

import '../../domain/entities/score_entity.dart';

extension ScoreDto on ScoreEntity {
  Map<String, dynamic> toMap() {
    return {
      'player_name': playerName,
      'points': points,
    };
  }

  static ScoreEntity fromMap(Map<String, dynamic> map) {
    return ScoreEntity(
      playerName: map['player_name'],
      points: map['points'],
    );
  }

  String toJson() => json.encode(toMap());

  static ScoreEntity fromJson(String source) => fromMap(json.decode(source));
}
