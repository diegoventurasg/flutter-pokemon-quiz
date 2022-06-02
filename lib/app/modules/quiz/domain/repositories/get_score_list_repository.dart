import 'package:dartz/dartz.dart';

import '../entities/player_entity.dart';
import '../errors/errors.dart';

abstract class IGetScoreListRepository {
  Future<Either<Failure, List<PlayerEntity>>> call();
}
