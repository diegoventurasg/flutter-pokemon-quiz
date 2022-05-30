import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_random_question_repository.dart';
import '../datasources/get_random_question_datasource.dart';

class GetRandomQuestionRepositoryImpl implements IGetRandomQuestionRepository {
  GetRandomQuestionRepositoryImpl(this.datasource);

  final IGetRandomQuestionDatasource datasource;

  @override
  Future<Either<Failure, QuestionEntity>> call(List<PokemonEntity> list) async {
    try {
      QuestionEntity question = await datasource(list);
      return right(question);
    } catch (e) {
      return left(DatasourceError());
    }
  }
}
