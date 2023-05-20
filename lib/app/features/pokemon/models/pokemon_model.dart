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
        json['name'].replaceFirst(json['name'][0], json['name'][0].toUpperCase()),
        json['sprites']['front_default'],
        json['weight'],
        (json['height'] as num) / 10,
        (json['moves'] as List).map((e) => PokemonMove.fromJson(e['move'])).toList(),
        (json['stats'] as List).map((e) => PokemonStat.fromJson(e)).toList(),
        (json['types'] as List).map((e) => PokemonType.fromJson(e['type'])).toList());
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
