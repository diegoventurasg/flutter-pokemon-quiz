import '../../domain/entities/score_entity.dart';

abstract class IGetScoreListDatasource {
  Future<List<ScoreEntity>> call();
}
