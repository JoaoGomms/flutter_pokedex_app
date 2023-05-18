import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_app/app/features/pokemon/services/pokemon_service.dart';

void main() {
  test('pokemon service ...', () async {
    var service = PokemonService(Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/')));
    await service.fetchAllPokemons();
  });
}
