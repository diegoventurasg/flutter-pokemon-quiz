import '../../domain/entities/pokemon_entity.dart';

abstract class IGetPokemonListDatasource {
  Future<List<PokemonEntity>> call();
}
