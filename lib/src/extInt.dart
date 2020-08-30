extension ExtInt on int {
  /// Returns zeros and ones for an int
  String toBinString() {
    var n = this;
    final xs = <int>[];
    for (; n > 0; n >>= 1) {
      xs.add(n & 1);
    }
    while (xs.length % 8 != 0) {
      xs.add(0);
    }
    return xs.reversed.map((x) => '$x').join('');
  }
}
