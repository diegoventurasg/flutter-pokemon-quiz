import 'package:dartz/dartz.dart';

import '../../domain/entities/score_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/add_score_repository.dart';
import '../datasources/add_score_datasource.dart';

class AddScoreRepositoryImpl implements IAddScoreRepository {
  AddScoreRepositoryImpl(this.datasource);

  final IAddScoreDatasource datasource;

  @override
  Future<Either<Failure, bool>> call(ScoreEntity score) async {
    try {
      bool? result = await datasource(score);
      return result ? right(result) : left(InternalError());
    } catch (e) {
      return left(DatasourceError());
    }
  }
}
