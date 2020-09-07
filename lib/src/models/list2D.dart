import 'dart:core';
import 'pos.dart';
import 'valueAt.dart';

class List2D<T> {
  final int rows;
  final int cols;
  final List<List<T>> _values;

  List2D(this.rows, this.cols, T Function(int row, int col) generator)
      : _values = List.generate(
            rows,
            (row) => List.generate(cols, (col) => generator(row, col),
                growable: false),
            growable: false);

  List2D.filled(this.rows, this.cols, T fill)
      : _values = List.generate(
            rows, (row) => List.filled(cols, fill, growable: false),
            growable: false);

  List2D.clone(List2D<T> other)
      : rows = other.rows,
        cols = other.cols,
        _values = List.generate(
            other.rows,
            (row) => List.generate(other.cols, (col) => other.at(row, col),
                growable: false),
            growable: false);

  List<T> operator [](int row) => _values[row];

  T at(int row, int col) => _values[row][col];

  T atPos(Pos p) => _values[p.row][p.col];

  bool validPos(int row, int col) =>
      row >= 0 && col >= 0 && row < rows && col < cols;

  List2D<U> map<U>(U Function(int row, int col, T value) f) =>
      List2D<U>(rows, cols, (row, col) => f(row, col, _values[row][col]));

  String toString() => _values.map((x) => x.toString()).join(',');

  Iterable<ValueAt<T>> get values =>
      Pos.range(rows, cols).map((pos) => ValueAt(pos, atPos(pos)));
}
