import 'dart:core';

Iterable<int> infiniteRange() sync* {
  var i = 0;
  while (true) {
    yield i++;
  }
}

Iterable<int> range(int size) => infiniteRange().take(size);
