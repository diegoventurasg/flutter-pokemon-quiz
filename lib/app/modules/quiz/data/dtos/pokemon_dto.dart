import '../../domain/entities/pokemon_entity.dart';

extension PokemonDto on PokemonEntity {
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  static PokemonEntity fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      name: map['name'],
      image: map['img'],
    );
  }
}
