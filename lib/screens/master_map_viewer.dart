import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/maps/wrapper/grid_overlay_map_wrapper.dart';
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
            if (snapshot.hasData) {
              List<String> mapsList = snapshot.data!;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ref.watch(selectedImageNotifier) == ''
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width * .2,
                            child: MapListView(mapsList: mapsList),
                          )
                        : Container(),
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .9,
                        width: MediaQuery.of(context).size.width,
                        child: const GridOverlayMapWrapper(),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Loading();
            }
          }),
    );
  }
}
