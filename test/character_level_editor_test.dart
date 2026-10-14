import 'dart:convert';
import 'dart:io';
import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/widgets/characters/individual_character_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> openEditor(WidgetTester tester, Character original,
      void Function(Character?) onSaved) async {
    await tester.binding.setSurfaceSize(const Size(1000, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(ProviderScope(
        child: MaterialApp(
            home: Builder(
      builder: (context) => Scaffold(
          body: ElevatedButton(
        onPressed: () async => onSaved(await showDialog<Character>(
          context: context,
          builder: (_) => Dialog(
              child: SingleChildScrollView(
                  child: IndividualCharacterCard(character: original))),
        )),
        child: const Text('Open editor'),
      )),
    ))));
    await tester.tap(find.text('Open editor'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
  }

  Finder field(String label) =>
      find.ancestor(of: find.text(label), matching: find.byType(TextFormField));

  testWidgets('editing level and names retains every nonedited field and image',
      (tester) async {
    final fixture = Directory.systemTemp.createTempSync('dnd-level-editor-');
    addTearDown(() => fixture.deleteSync(recursive: true));
    final icon = File('${fixture.path}/icon.png');
    icon.writeAsBytesSync(base64Decode(
        'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+A8AAQUBAScY42YAAAAASUVORK5CYII='));
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
        iconLocation: icon.path,
        xCord: 4,
        yCord: 5,
        id: 42);
    final before = original.toJson();
    Character? saved;
    await openEditor(tester, original, (result) => saved = result);
    await tester.enterText(field('First Name'), 'Renamed');
    await tester.enterText(field('Level (optional)'), '9');
    await tester.tap(find.text('Save Changes'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(saved, isNotNull);
    expect(saved!.toJson(), {...before, 'firstName': 'Renamed', 'level': 9});
    expect(original.toJson(), before);
    expect(tester.takeException(), isNull);
  });

  testWidgets('invalid fractional level does not save or mutate the character',
      (tester) async {
    final original =
        Character(firstName: 'Original', level: 7, strength: 18, id: 4);
    final before = original.toJson();
    Character? saved;
    await openEditor(tester, original, (result) => saved = result);
    await tester.enterText(field('First Name'), 'Changed');
    await tester.enterText(field('Level (optional)'), '2.5');
    await tester.tap(find.text('Save Changes'));
    await tester.pump();
    expect(saved, isNull);
    expect(original.toJson(), before);
    expect(find.text('Enter a whole-number level, or leave it blank.'),
        findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets(
      'blank level restores unknown while retaining unrelated attributes',
      (tester) async {
    final original = Character(
        firstName: 'Original',
        level: 7,
        vision: 90,
        speed: 35,
        armorClass: 20,
        id: 8);
    final before = original.toJson();
    Character? saved;
    await openEditor(tester, original, (result) => saved = result);
    await tester.enterText(field('Level (optional)'), '');
    await tester.tap(find.text('Save Changes'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    expect(saved!.toJson(), {...before, 'level': null});
    expect(original.toJson(), before);
    expect(tester.takeException(), isNull);
  });
}
