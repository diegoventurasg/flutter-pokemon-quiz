import '../../domain/entities/alternative_entity.dart';
import '../stores/life_store.dart';
import '../stores/pokemon_list_store.dart';
import '../stores/question_store.dart';
import '../stores/score_store.dart';

class QuizController {
  QuizController(
    this.pokemonListStore,
    this.questionStore,
    this.scoreStore,
    this.lifeStore,
  );

  final PokemonListStore pokemonListStore;
  final QuestionStore questionStore;
  final ScoreStore scoreStore;
  final LifeStore lifeStore;

  Future<void> init() async {
    scoreStore.init();
    lifeStore.init();
    await pokemonListStore.fetchData();
    await generateQuestion();
  }

  Future<void> generateQuestion() async {
    final list = pokemonListStore.state;
    await questionStore.fetchData(list);
  }

  Future<bool> checkAnswer(AlternativeEntity alternative) async {
    if (alternative.isCorrect) {
      scoreStore.increment();
    } else {
      lifeStore.decrement();
    }

    if (lifeStore.state > 0) {
      generateQuestion();
      return true;
    } else {
      return false;
    }
  }
}
