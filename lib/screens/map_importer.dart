import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/maps/wrapper/grid_overlay_map_wrapper.dart';
import 'package:dnddmcompanion/widgets/maps/map_list_view.dart';
import 'package:dnddmcompanion/widgets/loading.dart';
import 'package:flutter/material.dart';

class MapImporter extends StatelessWidget {
  const MapImporter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataServices ds = DataServices();

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<String>>(
          future: ds.getAllMaps(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String> mapsList = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: MapListView(mapsList: mapsList),
                    ),
                    const GridOverlayMapWrapper(),
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
