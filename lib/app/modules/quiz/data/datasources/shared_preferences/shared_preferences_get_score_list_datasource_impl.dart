import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/score_entity.dart';
import '../../dtos/score_dto.dart';
import '../get_score_list_datasource.dart';

class SharedPreferencesGetScoreListDatasourceImpl
    implements IGetScoreListDatasource {
  SharedPreferencesGetScoreListDatasourceImpl(this.shared);

  final SharedPreferences shared;

  @override
  Future<List<ScoreEntity>> call() async {
    try {
      final data = shared.getStringList('scores') ?? [];
      final list = data.map((e) => ScoreDto.fromJson(e)).toList();
      list.sort((a, b) => b.points - a.points);
      return list;
    } catch (e) {
      throw Exception();
    }
  }
}
