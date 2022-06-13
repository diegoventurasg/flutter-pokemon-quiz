import '../../domain/entities/pokemon_entity.dart';

extension PokemonDto on PokemonEntity {
  Map<String, dynamic> toMap() {
    return {
      'num': this.num,
      'name': name,
      'image': image,
    };
  }

  static PokemonEntity fromMap(Map<String, dynamic> map) {
    return PokemonEntity(
      num: map['num'],
      name: map['name'],
      image: map['img'],
    );
  }
}
