import 'package:dartz/dartz.dart';

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_pokemon_list_repository.dart';
import '../datasources/get_pokemon_list_datasource.dart';

class GetPokemonListRepositoryImpl implements IGetPokemonListRepository {
  GetPokemonListRepositoryImpl(this.datasource);

  final IGetPokemonListDatasource datasource;

  @override
  Future<Either<Failure, List<PokemonEntity>>> call() async {
    try {
      List<PokemonEntity> list = await datasource();
      return right(list);
    } catch (e) {
      return left(DatasourceError());
    }
  }
}
