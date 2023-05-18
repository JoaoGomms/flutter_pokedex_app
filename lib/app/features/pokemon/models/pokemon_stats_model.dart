class PokemonStat {
  final String name;
  final int value;

  PokemonStat(this.name, this.value);

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(json['stat']['name'], json['base_stat']);
  }
}
