import 'package:dartz/dartz.dart';

import '../entities/score_entity.dart';
import '../errors/errors.dart';

abstract class IAddScoreRepository {
  Future<Either<Failure, bool>> call(ScoreEntity score);
}
