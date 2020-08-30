import 'package:bamlib/bamlib.dart';

void main() {
  var oddNumbers = infiniteRange().skip(1).where((x) => x % 2 == 1);

  print('odd numbers: ${oddNumbers.take(10).toList()}');
}
