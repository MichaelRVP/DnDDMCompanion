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
  final Map<int, bool> wallMap;

  const GridSizing({
    this.totalWidthCells = 66,
    this.totalHeightCells = 50,
    this.topCellPadding = 0,
    this.bottomCellPadding = 0,
    this.leftCellPadding = 308,
    this.rightCellPadding = 308,
    this.cellTotal = 2700,
    this.wallMap = const {
      1717: true,
      1718: true,
      1719: true,
      1720: true,
      1721: true,
      1788: true,
      1854: true,
      1716: true,
      1920: true,
      1986: true,
      2052: true,
      2118: true,
      2184: true,
      2250: true,
      2316: true,
      2381: true,
      2446: true,
      2511: true,
      2576: true,
      2641: true,
      2179: true,
      2246: true,
      1917: true,
      1984: true,
      1916: true
    },
  });

  GridSizing copyWith({
    double? totalWidthCells,
    double? totalHeightCells,
    double? topCellPadding,
    double? bottomCellPadding,
    double? leftCellPadding,
    double? rightCellPadding,
    double? cellTotal,
    Map<int, bool>? wallMap,
  }) {
    return GridSizing(
      totalWidthCells: totalWidthCells ?? this.totalWidthCells,
      totalHeightCells: totalHeightCells ?? this.totalHeightCells,
      topCellPadding: topCellPadding ?? this.topCellPadding,
      bottomCellPadding: bottomCellPadding ?? this.bottomCellPadding,
      leftCellPadding: leftCellPadding ?? this.leftCellPadding,
      rightCellPadding: rightCellPadding ?? this.rightCellPadding,
      cellTotal: cellTotal ?? this.cellTotal,
      wallMap: wallMap ?? this.wallMap,
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
