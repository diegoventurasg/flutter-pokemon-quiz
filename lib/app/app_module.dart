import 'package:flutter_modular/flutter_modular.dart';

import 'modules/quiz/quiz_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/quiz', module: QuizModule()),
      ];
}
