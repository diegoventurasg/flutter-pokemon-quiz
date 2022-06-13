import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../core/consts/api_const.dart';
import '../../../domain/entities/pokemon_entity.dart';
import '../../dtos/pokemon_dto.dart';
import '../get_pokemon_list_datasource.dart';

class PokemonApiGetPokemonListDatasource implements IGetPokemonListDatasource {
  PokemonApiGetPokemonListDatasource(this.dio);

  final Dio dio;

  @override
  Future<List<PokemonEntity>> call() async {
    try {
      final response = await dio.get(ApiConst.apiUrl);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonDto.fromMap(e)).toList();
    } catch (e) {
      throw Exception();
    }
  }
}
