import '../../domain/entities/player_entity.dart';

abstract class IGetScoreListDatasource {
  Future<List<PlayerEntity>> call();
}
