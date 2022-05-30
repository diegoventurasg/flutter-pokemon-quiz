import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';
import '../entities/question_entity.dart';
import '../errors/errors.dart';

abstract class IGetRandomQuestionRepository {
  Future<Either<Failure, QuestionEntity>> call(List<PokemonEntity> list);
}
