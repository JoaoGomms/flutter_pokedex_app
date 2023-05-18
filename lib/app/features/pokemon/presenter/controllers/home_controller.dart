import 'package:mobx/mobx.dart';
import 'package:pokedex_app/app/features/pokemon/models/pokemon_model.dart';
import 'package:pokedex_app/app/features/pokemon/services/pokemon_service.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokemonService service;

  _HomeControllerBase(this.service);

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList();

  @action
  Future<void> fetchPokemons() async {
    var response = await service.fetchAllPokemons();

    pokemons.addAll(response);
  }
}
