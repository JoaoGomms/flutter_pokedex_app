// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_HomeControllerBase.pokemons', context: context);

  @override
  ObservableList<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$isLoadingPokemonsAtom =
      Atom(name: '_HomeControllerBase.isLoadingPokemons', context: context);

  @override
  bool get isLoadingPokemons {
    _$isLoadingPokemonsAtom.reportRead();
    return super.isLoadingPokemons;
  }

  @override
  set isLoadingPokemons(bool value) {
    _$isLoadingPokemonsAtom.reportWrite(value, super.isLoadingPokemons, () {
      super.isLoadingPokemons = value;
    });
  }

  late final _$dropdownValueAtom =
      Atom(name: '_HomeControllerBase.dropdownValue', context: context);

  @override
  String get dropdownValue {
    _$dropdownValueAtom.reportRead();
    return super.dropdownValue;
  }

  @override
  set dropdownValue(String value) {
    _$dropdownValueAtom.reportWrite(value, super.dropdownValue, () {
      super.dropdownValue = value;
    });
  }

  late final _$fetchPokemonsAsyncAction =
      AsyncAction('_HomeControllerBase.fetchPokemons', context: context);

  @override
  Future<void> fetchPokemons() {
    return _$fetchPokemonsAsyncAction.run(() => super.fetchPokemons());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void sortPokemons(String sortType) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.sortPokemons');
    try {
      return super.sortPokemons(sortType);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons},
isLoadingPokemons: ${isLoadingPokemons},
dropdownValue: ${dropdownValue}
    ''';
  }
}
