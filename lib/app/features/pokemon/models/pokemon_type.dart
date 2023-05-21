import 'package:flutter/material.dart';
import 'package:pokedex_app/app/theme/main.dart';

class PokemonType {
  final String name;

  PokemonType(this.name);

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(json['name']);
  }

  static getTypeColor(PokemonType mainType) =>
      {
        'bug': Palette.bugType,
        'dark': Palette.darkType,
        'dragon': Palette.dragonType,
        'electric': Palette.electricType,
        'fairy': Palette.fairyType,
        'fighting': Palette.fightingType,
        'fire': Palette.fireType,
        'flying': Palette.flyingType,
        'ghost': Palette.ghostType,
        'normal': Palette.normalType,
        'grass': Palette.grassType,
        'ground': Palette.groundType,
        'ice': Palette.iceType,
        'poison': Palette.poisonType,
        'psychic': Palette.psychicType,
        'rock': Palette.rockType,
        'steel': Palette.steelType,
        'water': Palette.waterType,
      }[mainType.name] ??
      Colors.white;
}
