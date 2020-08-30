import 'dart:core';
// import '../iterableExt.dart';
// import '../functions.dart';
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

  // ValueAt<T> valueAt(int row, int col) => ValueAt.fromRowCol(row, col, _values[row][col]);

  bool validPos(int row, int col) =>
      row >= 0 && col >= 0 && row < rows && col < cols;

  List2D<U> map<U>(U Function(int row, int col, T value) f) =>
      List2D<U>(rows, cols, (row, col) => f(row, col, _values[row][col]));

  String toString() => _values.map((x) => x.toString()).join(',');

  Iterable<ValueAt<T>> get values =>
      Pos.range(rows, cols).map((pos) => ValueAt(pos, atPos(pos)));
}

/*
  void forEach<T>(void Function(int row, int col, T value) f) =>
      range(rows).forEach((row) {
        final List<T> ys = this[row];
        range(rows).forEach((col) => f(row, col, ys[col]));
      });

class List2D<T> {
  final int rows;
  final int cols;
  final List<List<T>> values;

  List2D(this.rows, this.cols, T Function(int row, int col) generator)
      : values = List.generate(
            rows,
            (row) => List.generate(cols, (col) => generator(row, col),
                growable: false),
            growable: false);

  List2D.filled(this.rows, this.cols, T fill)
      : values = List.generate(
            rows, (row) => List.filled(cols, fill, growable: false),
            growable: false);

  List<T> operator [](int row) => values[row];

  bool validPos(int row, int col) =>
      row >= 0 && col >= 0 && row < rows && col < cols;

  void traverse(void Function(int row, int col, T value) f) {
    values.forEachi<List<List<T>>>((cols, row) {
      cols.forEachi((value, col) {
        f(row, col, value);
      });
    });
  }

  List2D<U> transform<U>(U Function(int row, int col, T value) f) =>
      List2D<U>(rows, cols, (row, col) => f(row, col, values[row][col]));

  String toString() => values.map((x) => x.toString()).join(',');
}

  void traverse(void Function(int row, int col, T value) f) {
    for (int row = 0; row < rows; row++) {
      final rv = values[row];
      for (int col = 0; col < cols; col++) {
        f(row, col, rv[col]);
      }
    }
  }

    values.forEachi<List<List<T>>>((cols, row) {
      cols.forEachi((value, col) {
        f(row, col, value);
      });
    });

class Foo<T> extends Iterable<T> {
  @override
  // TODO: implement iterator
  Iterator<T> get iterator => throw UnimplementedError();
}


class Collection2D<T> {
  int get rows => 0;
  int get cols => 0;
  List<T> operator [](int row) => <T>[];
}

extension Collection2DExt on Collection2D {
  bool validPos(int row, int col) =>
      row >= 0 && col >= 0 && row < rows && col < cols;

  void forEach<T>(void Function(int row, int col, T value) f) =>
      range(rows).forEach((row) {
        final List<T> ys = this[row];
        range(rows).forEach((col) => f(row, col, ys[col]));
      });

  Collection2D<U> map<T, U>(U Function(int row, int col, T value) f) =>
      List2D<U>(rows, cols, (row, col) => f(row, col, this[row][col]));
}

class List2D<T> implements Collection2D<T> {
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

  List<T> operator [](int row) => _values[row];

  String toString() => _values.map((x) => x.toString()).join(',');
}

*/
