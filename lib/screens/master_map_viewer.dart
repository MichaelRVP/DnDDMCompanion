import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/maps/wrapper/grid_overlay_import_wrapper.dart';
import 'package:dnddmcompanion/widgets/maps/map_list_view.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class MasetMapViewer extends ConsumerWidget {
  const MasetMapViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DataServices ds = DataServices();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<String>>(
        future: ds.getAllMaps(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Loading();
          }

          final List<String> mapsList = snapshot.data!;
          final bool hasSelection = ref.watch(selectedImageNotifier) != '';

          return LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: Row(
                      key: const ValueKey<String>('master-import-row'),
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (!hasSelection)
                          SizedBox(
                            width: constraints.maxWidth * .2,
                            child: MapListView(mapsList: mapsList),
                          ),
                        Expanded(
                          child: GridOverlayMapWrapper(
                            key: const ValueKey<String>(
                              'master-import-wrapper',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
