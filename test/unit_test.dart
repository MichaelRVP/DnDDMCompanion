import 'dart:convert';
import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/models/save_file.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Character level', () {
    test('leaves absent and legacy levels unknown', () {
      expect(Character().level, isNull);
      final legacy = Character().toJson()..remove('level');
      expect(Character.fromJson(legacy).level, isNull);
    });
    test('copy and decouple preserve every existing field', () {
      final original = Character(
          firstName: 'Original',
          lastName: 'Name',
          level: 7,
          strength: 11,
          dexterity: 12,
          constitution: 13,
          intelligence: 14,
          wisdom: 15,
          charisma: 16,
          vision: 60,
          speed: 30,
          initiative: 3,
          armorClass: 18,
          iconLocation: '/fixture/icon.png',
          xCord: 4,
          yCord: 5,
          id: 42);
      expect(original.copyWith().toJson(), original.toJson());
      expect(Character().decouple(original).toJson(), original.toJson());
      final renamed = original.copyWith(firstName: 'Renamed');
      expect(renamed.level, 7);
      expect(renamed.id, 42);
      final cleared = original.copyWith(clearLevel: true);
      expect(cleared.level, isNull);
      expect(original.level, 7);
    });
    test(
        'round-trips nondefault levels for characters and enemies through save JSON',
        () {
      final character = Character(
          firstName: 'Hero',
          level: 12,
          id: 0,
          strength: 18,
          iconLocation: '/fixture/hero.png',
          xCord: 3,
          yCord: 6);
      final enemy = Character(
          firstName: 'Enemy',
          level: 4,
          id: 0,
          armorClass: 19,
          speed: 40,
          xCord: 7,
          yCord: 2);
      final save = SaveFile(
          name: 'Level fixture',
          characters: [character],
          enemies: [enemy],
          maps: []);
      final encoded = jsonEncode(save.toJson());
      final restored =
          SaveFile.fromJson(jsonDecode(encoded) as Map<String, dynamic>);
      expect(restored.characters.single.toJson(), character.toJson());
      expect(restored.enemies.single.toJson(), enemy.toJson());
    });
  });
}
