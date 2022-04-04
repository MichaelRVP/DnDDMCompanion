import 'package:flutter/material.dart';

@immutable
class GridSizing {
  final int totalWidthCells;
  final int totalHeightCells;
  final double topCellPadding;
  final double bottomCellPadding;
  final double leftCellPadding;
  final double rightCellPadding;
  final double cellSizing;

  const GridSizing({
    required this.totalWidthCells,
    required this.totalHeightCells,
    required this.topCellPadding,
    required this.bottomCellPadding,
    required this.leftCellPadding,
    required this.rightCellPadding,
    required this.cellSizing,
  });

  GridSizing copyWith(
    int? totalWidthCells,
    int? totalHeightCells,
    double? topCellPadding,
    double? bottomCellPadding,
    double? leftCellPadding,
    double? rightCellPadding,
    double? cellSizing,
  ) {
    return GridSizing(
      totalWidthCells: totalWidthCells ?? this.totalHeightCells,
      totalHeightCells: totalHeightCells ?? this.totalHeightCells,
      topCellPadding: topCellPadding ?? this.topCellPadding,
      bottomCellPadding: bottomCellPadding ?? this.bottomCellPadding,
      leftCellPadding: leftCellPadding ?? this.leftCellPadding,
      rightCellPadding: rightCellPadding ?? this.rightCellPadding,
      cellSizing: cellSizing ?? this.cellSizing,
    );
  }
}

GridSizing defaultGrid() {
  return const GridSizing(
    totalWidthCells: 42,
    totalHeightCells: 66,
    topCellPadding: 50,
    bottomCellPadding: 16,
    leftCellPadding: 16,
    rightCellPadding: 50,
    cellSizing: 10,
  );
}
