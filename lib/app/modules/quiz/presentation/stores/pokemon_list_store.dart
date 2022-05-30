import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/get_pokemon_list_usecase.dart';

typedef PokemonList = List<PokemonEntity>;

class PokemonListStore extends StreamStore<Failure, PokemonList> {
  PokemonListStore(this._getPokemonListUseCase) : super([]);

  final IGetPokemonListUseCase _getPokemonListUseCase;

  Future<void> fetchData() async {
    setLoading(true);
    final result = await _getPokemonListUseCase();
    result.fold(
      (l) => setError(l),
      (r) => update(r),
    );
    setLoading(false);
  }
}
