import 'package:dnddmcompanion/services/data_services.dart';
import 'package:dnddmcompanion/widgets/images/map_list_view.dart';
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

              print(mapsList);

              return SizedBox(
                height: 250,
                child: MapListView(mapsList: mapsList),
              );
            } else {
              return const Loading();
            }
          }),
    );
  }
}
