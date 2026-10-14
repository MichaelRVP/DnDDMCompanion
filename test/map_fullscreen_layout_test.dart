import 'dart:convert';
import 'dart:typed_data';

import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/models/character.dart';
import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:dnddmcompanion/screens/master_map_viewer.dart';
import 'package:dnddmcompanion/widgets/characters/draggable_character_image.dart';
import 'package:dnddmcompanion/widgets/characters/small_character_row_list.dart';
import 'package:dnddmcompanion/widgets/maps/grid_map/grid_map_game.dart';
import 'package:dnddmcompanion/widgets/maps/wrapper/grid_overlay_game_wrapper.dart';
import 'package:dnddmcompanion/widgets/maps/wrapper/grid_overlay_import_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

const String _mapAsset = 'assets/images/maps/test-map.png';
const String _iconAsset = 'assets/images/playerIcons/Gwenlyn.png';
const String _png =
    'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNk+A8AAQUBAScY42YAAAAASUVORK5CYII=';

class FixtureAssetBundle extends CachingAssetBundle {
  final Uint8List _image = base64Decode(_png);

  @override
  Future<ByteData> load(String key) async {
    if (key == 'AssetManifest.bin') {
      return const StandardMessageCodec().encodeMessage(<String, dynamic>{
        _mapAsset: <dynamic>[
          <String, dynamic>{'asset': _mapAsset}
        ],
        _iconAsset: <dynamic>[
          <String, dynamic>{'asset': _iconAsset}
        ],
      })!;
    }
    final bytes = key == 'AssetManifest.json'
        ? Uint8List.fromList(utf8.encode(jsonEncode(<String, dynamic>{
            _mapAsset: <String>[_mapAsset],
          })))
        : _image;
    return ByteData.sublistView(bytes);
  }
}

void main() {
  late FixtureAssetBundle assets;

  setUp(() {
    assets = FixtureAssetBundle();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
      final key = utf8.decode(message!.buffer.asUint8List());
      return assets.load(key);
    });
  });
  tearDown(() => TestDefaultBinaryMessengerBinding
      .instance.defaultBinaryMessenger
      .setMockMessageHandler('flutter/assets', null));

  Future<void> mountGame(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(1000, 700));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          selectedImageNotifier.overrideWith((ref) => _mapAsset),
          gridSizingNotifierProvider.overrideWith((ref) {
            final notifier = GridSizingNotifier();
            notifier.updateGrid(const GridSizing(
              totalWidthCells: 2,
              totalHeightCells: 2,
              leftCellPadding: 0,
              rightCellPadding: 0,
              topCellPadding: 0,
              bottomCellPadding: 0,
              cellTotal: 4,
            ));
            return notifier;
          }),
        ],
        child: DefaultAssetBundle(
          bundle: assets,
          child: MaterialApp(
            home: Scaffold(
              appBar: AppBar(),
              body: GridOverlayGameWrapper(),
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets(
      'real game map expands to the available body and restores retained map state',
      (tester) async {
    await mountGame(tester);

    expect(find.byType(GridMapGame), findsOneWidget);
    expect(find.byType(SmallCharacterRowList), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('map-cell-0')), findsOneWidget);

    final dynamic target = tester.widget(
      find.descendant(
        of: find.byKey(const ValueKey<String>('map-cell-0')),
        matching: find.byType(DragTarget<Character>),
      ),
    );
    target.onAcceptWithDetails(DragTargetDetails<Character>(
      data: Character(
        firstName: 'Placed hero',
        id: 99,
        level: 11,
        iconLocation: _iconAsset,
      ),
      offset: Offset.zero,
    ));
    await tester.pump();
    expect(find.byType(DraggableCharacterImage), findsOneWidget);
    expect(
        tester
            .widget<DraggableCharacterImage>(
                find.byType(DraggableCharacterImage))
            .character
            .level,
        11);

    final interactiveFinder =
        find.byKey(const ValueKey<String>('map-interactive-viewer'));
    final InteractiveViewer viewer = tester.widget(interactiveFinder);
    final controller = viewer.transformationController!;
    controller.value = Matrix4.identity()
      ..translate(42.0, 31.0)
      ..scale(1.5);
    final retainedTransform = controller.value.clone();

    final normalSize =
        tester.getSize(find.byKey(const ValueKey<String>('game-map-region')));
    await tester.tap(find.byKey(const ValueKey<String>('map-expand-toggle')));
    await tester.pumpAndSettle();

    final expandedSize =
        tester.getSize(find.byKey(const ValueKey<String>('game-map-region')));
    expect(expandedSize.height, greaterThan(normalSize.height));
    expect(expandedSize.height,
        tester.getSize(find.byType(Scaffold)).height - kToolbarHeight);
    expect(find.byType(DraggableCharacterImage), findsOneWidget);
    expect(
        tester
            .widget<DraggableCharacterImage>(
                find.byType(DraggableCharacterImage))
            .character
            .level,
        11);
    expect(
        tester
            .widget<InteractiveViewer>(interactiveFinder)
            .transformationController,
        same(controller));
    expect(
        tester
            .widget<InteractiveViewer>(interactiveFinder)
            .transformationController!
            .value,
        retainedTransform);

    await tester.tap(find.byKey(const ValueKey<String>('map-expand-toggle')));
    await tester.pumpAndSettle();

    final restoredSize =
        tester.getSize(find.byKey(const ValueKey<String>('game-map-region')));
    expect(restoredSize, normalSize);
    expect(find.byType(DraggableCharacterImage), findsOneWidget);
    expect(
        tester
            .widget<DraggableCharacterImage>(
                find.byType(DraggableCharacterImage))
            .character
            .level,
        11);
    expect(
        tester
            .widget<InteractiveViewer>(interactiveFinder)
            .transformationController,
        same(controller));
    expect(
        tester
            .widget<InteractiveViewer>(interactiveFinder)
            .transformationController!
            .value,
        retainedTransform);
    expect(tester.takeException(), isNull);
  });

  for (final viewport in const [Size(1100, 720), Size(640, 420)]) {
    testWidgets(
        'import wrapper uses finite width inside the real horizontal Row at ${viewport.width}',
        (tester) async {
      await tester.binding.setSurfaceSize(viewport);
      addTearDown(() => tester.binding.setSurfaceSize(null));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            selectedImageNotifier.overrideWith((ref) => _mapAsset),
            gridSizingNotifierProvider.overrideWith((ref) {
              final notifier = GridSizingNotifier();
              notifier.updateGrid(const GridSizing(
                totalWidthCells: 2,
                totalHeightCells: 2,
                leftCellPadding: 0,
                rightCellPadding: 0,
                topCellPadding: 0,
                bottomCellPadding: 0,
                cellTotal: 4,
              ));
              return notifier;
            }),
          ],
          child: DefaultAssetBundle(
            bundle: assets,
            child: const MaterialApp(home: MasetMapViewer()),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byKey(const ValueKey<String>('master-import-row')),
          findsOneWidget);
      expect(find.byType(GridOverlayMapWrapper), findsOneWidget);
      final wrapperSize = tester.getSize(
        find.byKey(const ValueKey<String>('master-import-wrapper')),
      );
      expect(wrapperSize.width, viewport.width);
      expect(wrapperSize.width.isFinite, isTrue);
      expect(wrapperSize.height.isFinite, isTrue);
      expect(find.byKey(const ValueKey<String>('import-map-region')),
          findsOneWidget);
      await tester.ensureVisible(find.byIcon(Icons.save));
      await tester.pump();
      expect(tester.getCenter(find.byIcon(Icons.save)).dx,
          lessThan(viewport.width));
      expect(tester.takeException(), isNull);
    });
  }
}
