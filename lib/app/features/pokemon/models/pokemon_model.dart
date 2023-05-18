import 'package:pokedex_app/app/features/pokemon/util/enums/pokemon_type.dart';

import 'pokemon_move_model.dart';
import 'pokemon_stats_model.dart';

class PokemonModel {
  final int id;
  final String name;
  final double weight;
  final double height;
  final PokemonMoves moves;
  final PokemonStats stats;
  final PokemonType type;

  PokemonModel(this.id, this.name, this.weight, this.height, this.moves, this.stats, this.type);
}
