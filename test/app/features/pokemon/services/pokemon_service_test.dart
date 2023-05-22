import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_model.dart';
import 'package:pokedex_app/app/features/pokemon/services/pokemon_service.dart';

class DioMock extends Mock implements Dio {}

const mockedPokeApiData = {
  'id': 1,
  'name': 'Pokemon Name',
  'weight': 2,
  'height': 2,
  'sprites': {
    'front_default': 'Sprite Front Default Url',
  },
  'moves': [
    {
      'move': {'name': 'Move Name'}
    }
  ],
  'stats': [
    {
      'base_stat': 2,
      'stat': {'name': 'Stat Name'}
    }
  ],
  'types': [
    {
      'type': {'name': 'Pokemon Type'}
    }
  ],
};

void main() {
  late Dio dio;
  late PokemonService service;

  setUp(() {
    GetIt.I.registerFactory<Dio>(() => DioMock());
    dio = GetIt.I.get<Dio>();

    GetIt.I.registerFactory<PokemonService>(() => PokemonService(dio));
    service = GetIt.I.get<PokemonService>();
  });

  test('Should return a List of Pokemons', () async {
    var mockedPokeApiDataResponse =
        Response(data: mockedPokeApiData, statusCode: 200, requestOptions: RequestOptions());
    when(() => dio.get(any())).thenAnswer((_) async => mockedPokeApiDataResponse);

    List<PokemonModel> pokemonsReceived = await service.fetchAllPokemons();

    expect(service.limit, 21);
    expect(pokemonsReceived, isA<List<PokemonModel>>());
    expect(pokemonsReceived.length, 20);
  });
}
