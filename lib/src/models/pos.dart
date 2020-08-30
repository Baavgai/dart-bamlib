class Pos {
  final int hashCode;
  Pos(int row, int col) : hashCode = (row << 31) | col;
  Pos.fromInt(int n) : hashCode = n;
  // Pos.fromPos(Pos p) : hashCode = p.hashCode;
  int get row => hashCode >> 31;
  int get col => hashCode & 31;
  bool operator ==(x) => x is Pos && x.hashCode == hashCode;
  String toString() => "Pos($row, $col)";

  static Iterable<Pos> range(int rows, int cols) sync* {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        yield Pos(row, col);
      }
    }
  }
}

/*
class Pos {
  final int row;
  final int col;
  final int hashCode;
  Pos(this.row, this.col) : hashCode = (row << 31) | col;
  Pos.fromInt(int n) : hashCode = n, row = n >> 31, col = n & 31;
  bool operator ==(x) => x is Pos && x.row == row && x.col == col;
  String toString() => "Pos($row, $col)";
}

*/
