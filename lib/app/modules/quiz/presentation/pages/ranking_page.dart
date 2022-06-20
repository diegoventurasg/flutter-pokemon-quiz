import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/loader/loader.dart';
import '../../domain/entities/score_entity.dart';
import '../../domain/errors/errors.dart';
import '../components/score_list/score_list.dart';
import '../controllers/ranking_controller.dart';
import '../stores/ranking_store.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final RankingController controller = Modular.get<RankingController>();

  @override
  void initState() {
    super.initState();
    controller.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.background,
        elevation: 0,
        title: const Text("Ranking"),
      ),
      body: ScopedBuilder<RankingStore, Failure, List<ScoreEntity>>(
        store: controller.store,
        onLoading: (_) => const Center(child: Loader()),
        onError: (_, e) => const Center(child: Text('Error')),
        onState: (_, list) => ScoreList(list: list),
      ),
    );
  }
}
