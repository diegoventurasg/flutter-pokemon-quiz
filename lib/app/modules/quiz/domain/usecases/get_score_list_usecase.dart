import 'package:dartz/dartz.dart';

import '../entities/score_entity.dart';
import '../errors/errors.dart';
import '../repositories/get_score_list_repository.dart';

abstract class IGetScoreListUseCase {
  Future<Either<Failure, List<ScoreEntity>>> call();
}

class GetScoreListUseCaseImpl implements IGetScoreListUseCase {
  GetScoreListUseCaseImpl(this.repository);

  final IGetScoreListRepository repository;

  @override
  Future<Either<Failure, List<ScoreEntity>>> call() async {
    return await repository();
  }
}
