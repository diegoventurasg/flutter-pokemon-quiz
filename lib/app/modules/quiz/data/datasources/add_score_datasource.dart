import '../../domain/entities/score_entity.dart';

abstract class IAddScoreDatasource {
  Future<bool> call(ScoreEntity score);
}
