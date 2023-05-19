import 'package:dio/dio.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_model.dart';

class PokemonService {
  final Dio dio;

  PokemonService(this.dio);
  var limit = 1;

  Future<List<PokemonModel>> fetchAllPokemons() async {
    List<PokemonModel> pokemons = [];

    for (var id = limit; id < limit + 20; id++) {
      var response = await dio.get('pokemon/$id');

      pokemons.add(PokemonModel.fromJson(response.data));
    }
    limit += 20;

    return pokemons;
  }
}
