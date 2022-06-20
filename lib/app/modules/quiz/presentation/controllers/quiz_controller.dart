import '../stores/life_store.dart';
import '../stores/pokemon_list_store.dart';
import '../stores/question_store.dart';
import '../stores/score_store.dart';
import '../stores/selected_alternative_store.dart';

class QuizController {
  QuizController(
    this.pokemonListStore,
    this.questionStore,
    this.scoreStore,
    this.lifeStore,
    this.selectedAlternativeStore,
  );

  final PokemonListStore pokemonListStore;
  final QuestionStore questionStore;
  final ScoreStore scoreStore;
  final LifeStore lifeStore;
  final SelectedAlternativeStore selectedAlternativeStore;

  Future<void> init() async {
    scoreStore.init();
    lifeStore.init();
    await pokemonListStore.fetchData();
    await generateQuestion();
  }

  Future<bool> generateQuestion() async {
    selectedAlternativeStore.setAlternativeIndex(-1);
    if (lifeStore.state < 1) {
      return false;
    }
    final list = pokemonListStore.state;
    await questionStore.fetchData(list);
    return true;
  }

  Future<void> checkAnswer(bool isCorrect, int index) async {
    selectedAlternativeStore.setAlternativeIndex(index);
    if (isCorrect) {
      scoreStore.increment();
    } else {
      lifeStore.decrement();
    }
    await Future.delayed(const Duration(seconds: 1));
  }
}
