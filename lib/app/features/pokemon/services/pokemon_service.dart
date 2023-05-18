import 'package:dio/dio.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_model.dart';

class PokemonService {
  final Dio dio;

  PokemonService(this.dio);

  Future<List> getPokemonIdentificator() async {
    Response response = await dio.get('pokemon?limit=20&offset=0');

    if (response.statusCode == 200) {
      var pokemonData = (response.data['results'] as List).map((e) => e['url']).toList();
      return pokemonData;
    }

    throw Exception('API ERROR');
  }

  Future<List<PokemonModel>> fetchAllPokemons() async {
    var pokemonIdentificators = await getPokemonIdentificator();
    List<PokemonModel> pokemons = [];

    for (var id in pokemonIdentificators) {
      var response = await dio.get(id);

      pokemons.add(PokemonModel.fromJson(response.data));
    }

    return pokemons;
  }
}
