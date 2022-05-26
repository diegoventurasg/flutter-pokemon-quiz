import 'package:flutter_modular/flutter_modular.dart';

import 'splash_page.dart';

class SplashModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const SplashPage()),
      ];
}
