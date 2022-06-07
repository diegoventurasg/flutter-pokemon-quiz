import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/pokemonapi/pokemon_api_get_pokemon_list_datasource.dart';
import 'data/datasources/services/service_get_random_question_datasource.dart';
import 'data/repositories/get_pokemon_list_repository_impl.dart';
import 'data/repositories/get_random_question_repository_impl.dart';
import 'domain/usecases/get_pokemon_list_usecase.dart';
import 'domain/usecases/get_random_question_usecase.dart';
import 'presentation/controllers/quiz_controller.dart';
import 'presentation/pages/quiz_page.dart';
import 'presentation/pages/start_page.dart';
import 'presentation/stores/game_over_store.dart';
import 'presentation/stores/life_store.dart';
import 'presentation/stores/pokemon_list_store.dart';
import 'presentation/stores/question_store.dart';
import 'presentation/stores/score_store.dart';

class QuizModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //controllers
        Bind.factory(
            (i) => QuizController(i.get(), i.get(), i.get(), i.get(), i.get())),
        //stores
        Bind.factory((i) => PokemonListStore(i.get())),
        Bind.factory((i) => QuestionStore(i.get())),
        Bind.factory((i) => ScoreStore()),
        Bind.factory((i) => LifeStore()),
        Bind.factory((i) => GameOverStore()),
        //usecases
        Bind.factory((i) => GetPokemonListUseCaseImpl(i.get())),
        Bind.factory((i) => GetRandomQuestionUseCaseImpl(i.get())),
        //repositories
        Bind.factory((i) => GetPokemonListRepositoryImpl(i.get())),
        Bind.factory((i) => GetRandomQuestionRepositoryImpl(i.get())),
        //datasources
        Bind.factory((i) => PokemonApiGetPokemonListDatasource(i.get())),
        Bind.factory((i) => ServiceGetRandomQuestionDatasource()),
        //dio
        Bind.lazySingleton((i) => Dio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const StartPage()),
        ChildRoute('/game', child: (_, __) => const QuizPage()),
      ];
}
