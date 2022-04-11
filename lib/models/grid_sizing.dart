import 'package:flutter/material.dart';

@immutable
class GridSizing {
  final double totalWidthCells;
  final double totalHeightCells;
  final double topCellPadding;
  final double bottomCellPadding;
  final double leftCellPadding;
  final double rightCellPadding;
  final double cellTotal;

  const GridSizing({
    required this.totalWidthCells,
    required this.totalHeightCells,
    required this.topCellPadding,
    required this.bottomCellPadding,
    required this.leftCellPadding,
    required this.rightCellPadding,
    required this.cellTotal,
  });

  GridSizing copyWith({
    double? totalWidthCells,
    double? totalHeightCells,
    double? topCellPadding,
    double? bottomCellPadding,
    double? leftCellPadding,
    double? rightCellPadding,
    double? cellTotal,
  }) {
    return GridSizing(
      totalWidthCells: totalWidthCells ?? this.totalWidthCells,
      totalHeightCells: totalHeightCells ?? this.totalHeightCells,
      topCellPadding: topCellPadding ?? this.topCellPadding,
      bottomCellPadding: bottomCellPadding ?? this.bottomCellPadding,
      leftCellPadding: leftCellPadding ?? this.leftCellPadding,
      rightCellPadding: rightCellPadding ?? this.rightCellPadding,
      cellTotal: cellTotal ?? this.cellTotal,
    );
  }

  double getSizeFromString(String gridSizeText) {
    switch (gridSizeText) {
      case 'width':
        {
          return totalWidthCells;
        }
      case 'height':
        {
          return totalHeightCells;
        }
      case 'top':
        {
          return topCellPadding;
        }
      case 'bottom':
        {
          return bottomCellPadding;
        }
      case 'left':
        {
          return leftCellPadding;
        }
      case 'right':
        {
          return rightCellPadding;
        }
      case 'cell':
        {
          return cellTotal;
        }
      default:
        {
          return 0;
        }
    }
  }

  GridSizing updateSizeFromStringDouble({
    required String gridSizeText,
    required double newValue,
  }) {
    switch (gridSizeText) {
      case 'width':
        {
          return copyWith(totalWidthCells: newValue);
        }
      case 'height':
        {
          return copyWith(totalHeightCells: newValue);
        }
      case 'top':
        {
          return copyWith(topCellPadding: newValue);
        }
      case 'bottom':
        {
          return copyWith(bottomCellPadding: newValue);
        }
      case 'left':
        {
          return copyWith(leftCellPadding: newValue);
        }
      case 'right':
        {
          return copyWith(rightCellPadding: newValue);
        }
      case 'cell':
        {
          return copyWith(cellTotal: newValue);
        }
      default:
        {
          return copyWith();
        }
    }
  }
}

GridSizing defaultGrid() {
  return const GridSizing(
    totalWidthCells: 66,
    totalHeightCells: 50,
    topCellPadding: 0,
    bottomCellPadding: 0,
    leftCellPadding: 264,
    rightCellPadding: 264,
    cellTotal: 2700,
  );
}
