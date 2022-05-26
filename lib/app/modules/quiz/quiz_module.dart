import 'package:flutter_modular/flutter_modular.dart';

import 'start_page.dart';

class QuizModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const StartPage()),
      ];
}
