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

  @observable
  bool isLoadingPokemons = false;

  @observable
  String dropdownValue = '#';

  @action
  void sortPokemons(String sortType) {
    if (sortType == '#') {
      pokemons.sort(
        (a, b) => a.id.compareTo(b.id),
      );
    }

    if (sortType == 'A') {
      pokemons.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    }
  }

  @action
  Future<void> fetchPokemons() async {
    isLoadingPokemons = true;
    var response = await service.fetchAllPokemons();

    pokemons.addAll(response);
    sortPokemons(dropdownValue);

    isLoadingPokemons = false;
  }
}
