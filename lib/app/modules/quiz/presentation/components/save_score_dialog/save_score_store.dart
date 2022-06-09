import 'package:flutter_triple/flutter_triple.dart';

import '../../../domain/entities/score_entity.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/usecases/add_score_usecase.dart';

class SaveScoreStore extends StreamStore<Failure, bool> {
  SaveScoreStore(this._addSaveScoreUseCase) : super(false);

  final IAddScoreUseCase _addSaveScoreUseCase;

  Future<void> save(ScoreEntity score) async {
    setLoading(true);
    final result = await _addSaveScoreUseCase(score);
    result.fold((l) => setError(l), (r) => update(r));
    setLoading(false);
  }
}
