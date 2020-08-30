extension ExtInt on int {
  String toBinString() {
    int n = this;
    final xs = List<int>();
    for (; n > 0; n >>= 1) {
      xs.add(n & 1);
    }
    while (xs.length % 8 != 0) {
      xs.add(0);
    }
    return xs.reversed.map((x) => "$x").join('');
  }
}
