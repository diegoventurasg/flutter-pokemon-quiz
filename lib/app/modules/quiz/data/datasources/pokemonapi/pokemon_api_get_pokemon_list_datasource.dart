import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_pokemon_quiz/app/modules/quiz/domain/entities/pokemon_entity.dart';

import '../../dtos/pokemon_dto.dart';
import '../get_pokemon_list_datasource.dart';

class PokemonApiGetPokemonListDatasource implements IGetPokemonListDatasource {
  PokemonApiGetPokemonListDatasource(this.dio);

  final Dio dio;

  @override
  Future<List<PokemonEntity>> call() async {
    try {
      final response = await dio.get(
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonDto.fromMap(e)).toList();
    } catch (e) {
      throw Exception();
    }
  }
}
