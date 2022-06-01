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
    //correct alternative
    int answer = random.nextInt(4);
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

    List<PokemonEntity> alternatives =
        indexOfAlternatives.map((e) => list[e]).toList();

    List<QuestionType> typeList = QuestionType.values;
    //question type
    QuestionType type = typeList[random.nextInt(typeList.length)];

    QuestionEntity question = QuestionEntity(
      type: type,
      question: alternatives[answer],
      alternative1: AlternativeEntity(
        alternative: alternatives[0],
        isCorrect: answer == 0,
      ),
      alternative2: AlternativeEntity(
        alternative: alternatives[1],
        isCorrect: answer == 1,
      ),
      alternative3: AlternativeEntity(
        alternative: alternatives[2],
        isCorrect: answer == 2,
      ),
      alternative4: AlternativeEntity(
        alternative: alternatives[3],
        isCorrect: answer == 3,
      ),
    );

    return question;
  }
}
