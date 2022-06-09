import 'package:dartz/dartz.dart';

import '../entities/score_entity.dart';
import '../errors/errors.dart';
import '../repositories/add_score_repository.dart';

abstract class IAddScoreUseCase {
  Future<Either<Failure, bool>> call(ScoreEntity score);
}

class AddScoreUseCaseImpl implements IAddScoreUseCase {
  AddScoreUseCaseImpl(this.repository);

  final IAddScoreRepository repository;

  @override
  Future<Either<Failure, bool>> call(ScoreEntity score) async {
    return repository(score);
  }
}
