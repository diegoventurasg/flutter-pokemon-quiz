import 'dart:math';

import '../../../domain/entities/alternative_entity.dart';
import '../../../domain/entities/pokemon_entity.dart';
import '../../../domain/entities/question_entity.dart';
import '../get_random_question_datasource.dart';

class ServiceGetRandomQuestionDatasource
    implements IGetRandomQuestionDatasource {
  @override
  Future<QuestionEntity> call(List<PokemonEntity> list) async {
    int length = list.length;

    if (length < 4) {
      throw Exception();
    }

    Random random = Random();
    //alternative list
    List<int> indexOfAlternatives = [];
    int i = 0;
    while (i < 4) {
      int randomPokemon = random.nextInt(length);
      bool isRepeated = indexOfAlternatives.contains(randomPokemon);
      if (!isRepeated) {
        indexOfAlternatives.add(randomPokemon);
        i++;
      }
    }

    //correct alternative
    int answerIndex = random.nextInt(4);
    int alternativeCorrectIndex = indexOfAlternatives[answerIndex];

    List<AlternativeEntity> alternatives = indexOfAlternatives
        .map((e) => AlternativeEntity(
            alternative: list[e], isCorrect: alternativeCorrectIndex == e))
        .toList();

    QuestionEntity question = QuestionEntity(
      question: alternatives[answerIndex].alternative,
      alternatives: alternatives,
    );

    return question;
  }
}
