import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/score_entity.dart';
import '../../dtos/score_dto.dart';
import '../add_score_datasource.dart';

class SharedPreferencesAddScoreDatasourceImpl implements IAddScoreDatasource {
  SharedPreferencesAddScoreDatasourceImpl(this.shared);

  final SharedPreferences shared;

  @override
  Future<bool> call(ScoreEntity score) async {
    try {
      final data = shared.getStringList('scores') ?? [];
      final list = data.map((e) => ScoreDto.fromJson(e)).toList();
      list.add(score);
      final encodedList = list.map((e) => e.toJson()).toList();
      return await shared.setStringList('scores', encodedList);
    } catch (e) {
      throw Exception();
    }
  }
}
