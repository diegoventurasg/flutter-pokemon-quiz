import 'alternative_entity.dart';
import 'pokemon_entity.dart';

class QuestionEntity {
  QuestionEntity({
    this.question = const PokemonEntity(),
    this.alternatives = const [],
  });

  final PokemonEntity question;
  final List<AlternativeEntity> alternatives;
}
