extension ExtIterable on Iterable {
  Iterable<U> mapi<T, U>(U Function(T value, int index) mapper) sync* {
    var i = 0;
    for (final x in this) {
      yield mapper(x, i++);
    }
  }

  void forEachi<T>(void Function(T value, int index) f) {
    var i = 0;
    for (final x in this) {
      f(x, i++);
    }
  }
}
