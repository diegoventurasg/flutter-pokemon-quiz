import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';
import '../errors/errors.dart';
import '../repositories/get_pokemon_list_repository.dart';

abstract class IGetPokemonListUseCase {
  Future<Either<Failure, List<PokemonEntity>>> call();
}

class GetPokemonListUseCaseImpl implements IGetPokemonListUseCase {
  GetPokemonListUseCaseImpl(this.repository);

  final IGetPokemonListRepository repository;

  @override
  Future<Either<Failure, List<PokemonEntity>>> call() async {
    final result = await repository();
    return result.fold(
      (l) => left(l),
      (r) => r.isEmpty ? left(EmptyList()) : right(r),
    );
  }
}
