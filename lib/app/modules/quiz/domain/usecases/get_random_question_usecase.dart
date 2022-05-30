import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';
import '../entities/question_entity.dart';
import '../errors/errors.dart';
import '../repositories/get_random_question_repository.dart';

abstract class IGetRandomQuestionUseCase {
  Future<Either<Failure, QuestionEntity>> call(List<PokemonEntity> list);
}

class GetRandomQuestionUseCaseImpl implements IGetRandomQuestionUseCase {
  GetRandomQuestionUseCaseImpl(this.repository);

  final IGetRandomQuestionRepository repository;

  @override
  Future<Either<Failure, QuestionEntity>> call(List<PokemonEntity> list) async {
    return await repository(list);
  }
}
