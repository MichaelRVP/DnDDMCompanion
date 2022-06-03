class Coordinate {
  final int x;
  final int y;

  const Coordinate({required this.x, required this.y});

  bool compareCords(Coordinate otherCoordinate) {
    if (x == otherCoordinate.x && y == otherCoordinate.y) {
      return true;
    } else {
      return false;
    }
  }
}
