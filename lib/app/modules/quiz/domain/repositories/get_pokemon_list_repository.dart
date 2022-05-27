import 'package:dartz/dartz.dart';

import '../entities/pokemon_entity.dart';
import '../errors/errors.dart';

abstract class IGetPokemonListRepository {
  Future<Either<Failure, List<PokemonEntity>>> call();
}
