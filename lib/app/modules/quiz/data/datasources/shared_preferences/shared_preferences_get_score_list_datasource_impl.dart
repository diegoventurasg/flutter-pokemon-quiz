import 'dart:convert';

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
      final data = shared.getString('scores') ?? '';
      final json = jsonDecode(data) as List<dynamic>;
      return json.map((e) => ScoreDto.fromMap(e)).toList();
    } catch (e) {
      throw Exception();
    }
  }
}
