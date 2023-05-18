class PokemonMove {
  final String name;

  PokemonMove(this.name);

  factory PokemonMove.fromJson(Map<String, dynamic> json) {
    return PokemonMove(json['name']);
  }
}
