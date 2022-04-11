import 'package:dnddmcompanion/models/grid_sizing.dart';
import 'package:dnddmcompanion/models/providers/grid_sizing_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverlayControlBundle extends ConsumerWidget {
  final String hintText;
  final String gridSizeOption;

  const OverlayControlBundle({
    Key? key,
    required this.hintText,
    required this.gridSizeOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final GridSizing gridSizing = ref.watch(gridSizingNotifierProvider);

    double incrementer = gridSizing.getSizeFromString(gridSizeOption);

    final TextEditingController textEditingController =
        TextEditingController(text: incrementer.toString());

    return Row(
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                if (incrementer > 0) {
                  ref
                      .read(gridSizingNotifierProvider.notifier)
                      .updateGrid(gridSizing.updateSizeFromStringDouble(
                        gridSizeText: gridSizeOption,
                        newValue: incrementer - 1,
                      ));
                }
              },
              icon: const Icon(Icons.remove),
            ),
            IconButton(
              onPressed: () {
                ref
                    .read(gridSizingNotifierProvider.notifier)
                    .updateGrid(gridSizing.updateSizeFromStringDouble(
                      gridSizeText: gridSizeOption,
                      newValue: incrementer + 1,
                    ));
              },
              icon: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 50,
          child: Focus(
            onFocusChange: (value) {
              incrementer = double.parse(textEditingController.text);

              ref
                  .read(gridSizingNotifierProvider.notifier)
                  .updateGrid(gridSizing.updateSizeFromStringDouble(
                    gridSizeText: gridSizeOption,
                    newValue: incrementer,
                  ));
            },
            child: TextFormField(
              controller: textEditingController,
              validator: (value) {
                if (double.tryParse(value ?? '') == null) {
                  return "Please enter a number";
                }
                return null;
              },
            ),
          ),
        ),
        Text(" $hintText"),
      ],
    );
  }
}
