import 'package:get_it/get_it.dart';
import 'package:pokedex_app/app/features/pokemon/presenter/controllers/home_controller.dart';
import 'package:pokedex_app/app/features/pokemon/services/pokemon_service.dart';
import 'package:pokedex_app/app/infrastructure/pokemon_client/main.dart';

init() {
  registerPokemonClient();

  GetIt.I.registerFactory<PokemonService>(() => PokemonService(GetIt.I.get()));
  GetIt.I.registerSingleton<HomeController>(HomeController(GetIt.I.get()));
}
