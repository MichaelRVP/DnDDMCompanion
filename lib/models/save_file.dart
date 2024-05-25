import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/models/map_data.dart';

class SaveFile {
  final String name;
  final List<Character> characters;
  final List<Character> enemies;
  final List<MapData> maps;
  final int index;

  const SaveFile({
    required this.name,
    required this.characters,
    required this.enemies,
    required this.maps,
    this.index = 0,
  });

  //to json
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'characters': characters.map((character) => character.toJson()).toList(),
      'enemies': enemies.map((enemy) => enemy.toJson()).toList(),
      'maps': maps.map((map) => map.toJson()).toList(),
    };
  }

  //from json
  factory SaveFile.fromJson(Map<String, dynamic> json) {
    return SaveFile(
      name: json['name'],
      characters: json['characters']
          .map<Character>((character) => Character.fromJson(character))
          .toList(),
      enemies: json['enemies']
          .map<Character>((enemy) => Character.fromJson(enemy))
          .toList(),
      maps: json['maps'].map<MapData>((map) => MapData.fromJson(map)).toList(),
    );
  }
}
