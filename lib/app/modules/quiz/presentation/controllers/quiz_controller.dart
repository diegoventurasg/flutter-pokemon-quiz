import '../stores/pokemon_list_store.dart';
import '../stores/question_store.dart';

class QuizController {
  QuizController(this.pokemonListStore, this.questionStore) {
    pokemonListStore.fetchData().then((value) => generateQuestion());
  }

  final PokemonListStore pokemonListStore;
  final QuestionStore questionStore;

  Future<void> generateQuestion() async {
    final list = pokemonListStore.state;
    await questionStore.fetchData(list);
  }
}
