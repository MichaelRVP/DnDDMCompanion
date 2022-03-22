import 'package:dnddmcompanion/main.dart';
import 'package:dnddmcompanion/widgets/images/small_image_icon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapListView extends ConsumerWidget {
  const MapListView({
    Key? key,
    required this.mapsList,
  }) : super(key: key);

  final List<String> mapsList;

  @override
  Widget build(BuildContext context, ref) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white.withOpacity(.8)),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Select a map to import',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )),
            SizedBox(
              height: constraints.maxHeight * .8,
              child: ListView.builder(
                itemCount: mapsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(selectedImageNotifier.notifier).state =
                          mapsList[index];
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 250,
                        child: SmallImageIconCard(
                          imageString: mapsList[index],
                        ),
                      ),
                    ),
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
