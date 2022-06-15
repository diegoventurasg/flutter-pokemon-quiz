import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/usecases/get_random_question_usecase.dart';

class QuestionStore extends StreamStore<Exception, QuestionEntity> {
  QuestionStore(this._getRandomQuestionUseCase) : super(QuestionEntity());

  final IGetRandomQuestionUseCase _getRandomQuestionUseCase;

  Future<void> fetchData(List<PokemonEntity> list) async {
    setLoading(true);
    final result = await _getRandomQuestionUseCase(list);
    result.fold(setError, update);
    setLoading(false);
  }
}
