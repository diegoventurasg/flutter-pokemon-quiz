import '../stores/ranking_store.dart';

class RankingController {
  RankingController(this.store);

  final RankingStore store;

  Future<void> get() async {
    await store.fetchData();
  }
}
