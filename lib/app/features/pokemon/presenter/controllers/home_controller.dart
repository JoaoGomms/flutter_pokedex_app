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
  String dropdownValue = 'A';

  @action
  void sortPokemons(int sortType) {
    if (sortType == 0) {
      pokemons.sort(
        (a, b) => a.id.compareTo(b.id),
      );
    }

    if (sortType == 1) {
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
    isLoadingPokemons = false;
  }
}
