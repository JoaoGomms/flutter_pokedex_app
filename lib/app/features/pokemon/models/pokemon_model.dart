import 'package:pokedex_app/app/util/extensions.dart';

import 'pokemon_move_model.dart';
import 'pokemon_stats_model.dart';
import 'pokemon_type.dart';

class PokemonModel {
  final int id;
  final String name;
  final String imgUrl;
  final num weight;
  final num height;
  final List<PokemonMove> moves;
  final List<PokemonStat> stats;
  final List<PokemonType> types;

  PokemonModel(
    this.id,
    this.name,
    this.imgUrl,
    this.weight,
    this.height,
    this.moves,
    this.stats,
    this.types,
  );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        json['id'],
        (json['name'] as String).capitalize(),
        json['sprites']['front_default'],
        (json['weight'] as num) / 10,
        (json['height'] as num) / 10,
        (json['moves'] as List).map((e) => PokemonMove.fromJson(e['move'])).toList(),
        (json['stats'] as List).map((e) => PokemonStat.fromJson(e)).toList(),
        (json['types'] as List).map((e) => PokemonType.fromJson(e['type'])).toList());
  }
}
