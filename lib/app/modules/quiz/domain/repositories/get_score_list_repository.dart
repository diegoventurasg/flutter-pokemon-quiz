import 'package:dartz/dartz.dart';

import '../entities/score_entity.dart';
import '../errors/errors.dart';

abstract class IGetScoreListRepository {
  Future<Either<Failure, List<ScoreEntity>>> call();
}
