import '../../domain/entities/alternative_entity.dart';
import '../stores/game_over_store.dart';
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
    this.gameOverStore,
  );

  final PokemonListStore pokemonListStore;
  final QuestionStore questionStore;
  final ScoreStore scoreStore;
  final LifeStore lifeStore;
  final GameOverStore gameOverStore;

  Future<void> init() async {
    await pokemonListStore.fetchData();
    await generateQuestion();
  }

  Future<void> generateQuestion() async {
    final list = pokemonListStore.state;
    await questionStore.fetchData(list);
  }

  Future<void> checkAnswer(AlternativeEntity alternative) async {
    if (alternative.isCorrect) {
      scoreStore.increment();
    } else {
      lifeStore.decrement();
    }

    if (lifeStore.state > 0) {
      generateQuestion();
    } else {
      gameOverStore.setGameOver();
    }
  }

  void closeQuiz() {
    gameOverStore.setGameOver();
  }

  void clearQuiz() {
    questionStore.reset();
    scoreStore.reset();
    lifeStore.reset();
    gameOverStore.reset();
  }
}
