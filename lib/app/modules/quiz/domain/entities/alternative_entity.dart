import 'pokemon_entity.dart';

class AlternativeEntity {
  const AlternativeEntity({
    this.alternative = const PokemonEntity(),
    this.isCorrect = false,
  });

  final PokemonEntity alternative;
  final bool isCorrect;
}
