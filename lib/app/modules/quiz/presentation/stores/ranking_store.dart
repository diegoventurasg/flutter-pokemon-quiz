import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/score_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/get_score_list_usecase.dart';

class RankingStore extends StreamStore<Failure, List<ScoreEntity>> {
  RankingStore(this._getScoreListUseCase) : super([]);

  final IGetScoreListUseCase _getScoreListUseCase;

  Future<void> fetchData() async {
    setLoading(true);
    final result = await _getScoreListUseCase();
    result.fold(setError, update);
    setLoading(false);
  }
}
