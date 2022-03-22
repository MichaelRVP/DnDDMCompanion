import 'package:dnddmcompanion/widgets/images/small_image_icon_card.dart';
import 'package:flutter/material.dart';

class MapListView extends StatelessWidget {
  const MapListView({
    Key? key,
    required this.mapsList,
  }) : super(key: key);

  final List<String> mapsList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Select a map to import'),
            SizedBox(
              height: constraints.maxHeight * .9,
              child: ListView.builder(
                itemCount: mapsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        width: 250,
                        child:
                            SmallImageIconCard(imageString: mapsList[index])),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
