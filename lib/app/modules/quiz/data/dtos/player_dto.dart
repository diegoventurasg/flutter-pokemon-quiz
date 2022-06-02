import '../../domain/entities/player_entity.dart';

extension PlayerDto on PlayerEntity {
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'score': score,
    };
  }

  static PlayerEntity fromMap(Map<String, dynamic> map) {
    return PlayerEntity(
      name: map['name'],
      score: map['score'],
    );
  }
}
