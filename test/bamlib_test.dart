import 'package:bamlib/bamlib.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    Awesome awesome;

    setUp(() {
      awesome = Awesome();
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}

/*
  print(range(5));
  print(List2D(2, 3, (r, c) => (r + 1) * (c + 10)));
  print(15.toBinString());
  range(5).map((e) => e + 12).forEach((x) => print("$x: ${x.toBinString()}"));
*/