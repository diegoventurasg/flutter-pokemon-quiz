import 'alternative_entity.dart';
import 'pokemon_entity.dart';

enum QuestionType {
  image,
  name,
}

class QuestionEntity {
  QuestionEntity({
    this.type = QuestionType.image,
    this.question = const PokemonEntity(),
    this.alternative1 = const AlternativeEntity(),
    this.alternative2 = const AlternativeEntity(),
    this.alternative3 = const AlternativeEntity(),
    this.alternative4 = const AlternativeEntity(),
  });

  final QuestionType type;
  final PokemonEntity question;
  final AlternativeEntity alternative1;
  final AlternativeEntity alternative2;
  final AlternativeEntity alternative3;
  final AlternativeEntity alternative4;
}
