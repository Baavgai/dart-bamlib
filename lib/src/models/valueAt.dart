import 'pos.dart';

class ValueAt<T> implements Pos {
  final T value;
  final Pos pos;
  ValueAt(this.pos, this.value);
  ValueAt.fromRowCol(int row, int col, this.value) : pos = Pos(row, col);
  int get row => pos.row;
  int get col => pos.col;
  bool operator ==(x) => x is ValueAt<T> && x.pos == pos && x.value == value;
  String toString() => "ValueAt($pos, $value)";
}
