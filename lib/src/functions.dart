import 'dart:core';

/// numbers, all the way down.
Iterable<int> infiniteRange() sync* {
  var i = 0;
  while (true) {
    yield i++;
  }
}

/// offers an interable range
Iterable<int> range(int size) => infiniteRange().take(size);
