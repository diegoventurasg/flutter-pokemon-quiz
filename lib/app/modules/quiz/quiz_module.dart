import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasources/pokemonapi/pokemon_api_get_pokemon_list_datasource.dart';
import 'data/datasources/services/service_get_random_question_datasource.dart';
import 'data/datasources/shared_preferences/shared_preferences_add_score_datasource_impl.dart';
import 'data/datasources/shared_preferences/shared_preferences_get_score_list_datasource_impl.dart';
import 'data/repositories/add_score_repository_impl.dart';
import 'data/repositories/get_pokemon_list_repository_impl.dart';
import 'data/repositories/get_random_question_repository_impl.dart';
import 'data/repositories/get_score_list_repository_impl.dart';
import 'domain/usecases/add_score_usecase.dart';
import 'domain/usecases/get_pokemon_list_usecase.dart';
import 'domain/usecases/get_random_question_usecase.dart';
import 'domain/usecases/get_score_list_usecase.dart';
import 'presentation/components/save_score_dialog/save_score_controller.dart';
import 'presentation/components/save_score_dialog/save_score_store.dart';
import 'presentation/controllers/quiz_controller.dart';
import 'presentation/controllers/ranking_controller.dart';
import 'presentation/pages/quiz_page.dart';
import 'presentation/pages/ranking_page.dart';
import 'presentation/pages/start_page.dart';
import 'presentation/stores/life_store.dart';
import 'presentation/stores/pokemon_list_store.dart';
import 'presentation/stores/question_store.dart';
import 'presentation/stores/ranking_store.dart';
import 'presentation/stores/score_store.dart';

class QuizModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //controllers
        Bind.factory((i) => QuizController(i.get(), i.get(), i.get(), i.get())),
        Bind.factory((i) => SaveScoreController(i.get())),
        Bind.factory((i) => RankingController(i.get())),
        //stores
        Bind.factory((i) => PokemonListStore(i.get())),
        Bind.factory((i) => QuestionStore(i.get())),
        Bind.factory((i) => ScoreStore()),
        Bind.factory((i) => LifeStore()),
        Bind.factory((i) => SaveScoreStore(i.get())),
        Bind.factory((i) => RankingStore(i.get())),
        //usecases
        Bind.factory((i) => GetPokemonListUseCaseImpl(i.get())),
        Bind.factory((i) => GetRandomQuestionUseCaseImpl(i.get())),
        Bind.factory((i) => AddScoreUseCaseImpl(i.get())),
        Bind.factory((i) => GetScoreListUseCaseImpl(i.get())),
        //repositories
        Bind.factory((i) => GetPokemonListRepositoryImpl(i.get())),
        Bind.factory((i) => GetRandomQuestionRepositoryImpl(i.get())),
        Bind.factory((i) => AddScoreRepositoryImpl(i.get())),
        Bind.factory((i) => GetScoreListRepositoryImpl(i.get())),
        //datasources
        Bind.factory((i) => PokemonApiGetPokemonListDatasource(i.get())),
        Bind.factory((i) => ServiceGetRandomQuestionDatasource()),
        Bind.factory((i) => SharedPreferencesAddScoreDatasourceImpl(i.get())),
        Bind.factory(
            (i) => SharedPreferencesGetScoreListDatasourceImpl(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const StartPage()),
        ChildRoute('/game', child: (_, __) => const QuizPage()),
        ChildRoute('/ranking', child: (_, __) => const RankingPage()),
      ];
}
