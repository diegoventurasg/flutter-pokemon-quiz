import 'dart:math';

import '../../../domain/entities/alternative_entity.dart';
import '../../../domain/entities/pokemon_entity.dart';
import '../../../domain/entities/question_entity.dart';
import '../get_random_question_datasource.dart';

class ServiceGetRandomQuestionDatasource
    implements IGetRandomQuestionDatasource {
  @override
  Future<QuestionEntity> call(List<PokemonEntity> list) async {
    int pokemonListLength = list.length;

    //each quiz question has 4 alternatives
    //if pokemonListLength < 4 throw an Exception
    if (pokemonListLength < 4) {
      throw Exception();
    }

    //uses Random to generate the quiz question
    Random random = Random();

    //correct alternative
    int correctAlternativeIndex = random.nextInt(4); //0, 1, 2 or 3

    List<AlternativeEntity> alternatives = [];
    int i = 0;
    while (i < 4) {
      int randomIndex = random.nextInt(pokemonListLength);
      PokemonEntity randomPokemon = list[randomIndex];
      bool isRepeated = alternatives
          .any((e) => e.alternative.num.compareTo(randomPokemon.num) == 0);
      if (!isRepeated) {
        alternatives.add(AlternativeEntity(
          alternative: randomPokemon,
          isCorrect: correctAlternativeIndex == i,
        ));
        i++;
      }
    }

    QuestionEntity question = QuestionEntity(
      question: alternatives[correctAlternativeIndex].alternative,
      alternatives: alternatives,
    );

    return question;
  }
}
