import 'package:dartz/dartz.dart';

import '../../domain/entities/player_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_score_list_repository.dart';
import '../datasources/get_score_list_datasource.dart';

class GetScoreListRepositoryImpl implements IGetScoreListRepository {
  GetScoreListRepositoryImpl(this.datasource);

  final IGetScoreListDatasource datasource;

  @override
  Future<Either<Failure, List<PlayerEntity>>> call() async {
    try {
      List<PlayerEntity> scores = await datasource();
      return right(scores);
    } catch (e) {
      return left(DatasourceError());
    }
  }
}
