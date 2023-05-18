import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void registerPokemonClient() {
  GetIt.I.registerFactory<Dio>(() => Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2/')));
}
