class PokemonType {
  final String name;

  PokemonType(this.name);

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(json['name']);
  }
}
