import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/question_entity.dart';

abstract class IGetRandomQuestionDatasource {
  Future<QuestionEntity> call(List<PokemonEntity> list);
}
