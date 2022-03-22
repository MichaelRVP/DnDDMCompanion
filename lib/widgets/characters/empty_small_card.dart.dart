import 'package:flutter/material.dart';

class EmptySmallCard extends StatelessWidget {
  final int totalCharacters;

  const EmptySmallCard({
    required this.totalCharacters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.9)),
            child: Column(
              children: const [
                Spacer(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
