import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/models/map_data.dart';

class SaveFile {
  final String name;
  final List<Character> characters;
  final List<Character> enemies;
  final List<MapData> maps;
  final int? index;

  const SaveFile({
    required this.name,
    required this.characters,
    required this.enemies,
    required this.maps,
    this.index,
  });

  //copy with
  SaveFile copyWith({
    String? name,
    List<Character>? characters,
    List<Character>? enemies,
    List<MapData>? maps,
    int? id,
  }) {
    return SaveFile(
      name: name ?? this.name,
      characters: characters ?? this.characters,
      enemies: enemies ?? this.enemies,
      maps: maps ?? this.maps,
      index: id ?? index,
    );
  }

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

  //add a new character
  SaveFile addCharacter(Character character) {
    return copyWith(
      characters: [...characters, character.copyWith(id: characters.length)],
    );
  }

  //update a character
  SaveFile updateCharacter(Character character) {
    List<Character> updatedCharacters = characters.toList();

    updatedCharacters[character.id] = character;

    return copyWith(
      characters: updatedCharacters,
    );
  }

  //add enemy
  SaveFile addEnemy(Character enemy) {
    return copyWith(
      enemies: [...enemies, enemy.copyWith(id: enemies.length)],
    );
  }

  //update enemy
  SaveFile updateEnemy(Character enemy) {
    List<Character> updatedEnemies = enemies.toList();

    updatedEnemies[enemy.id] = enemy;

    return copyWith(
      enemies: updatedEnemies,
    );
  }

  
}
