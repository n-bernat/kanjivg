import 'package:kanjivg/kanjivg.dart';
import 'package:test/test.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();

    expect(calculator.addOne(2), equals(3));
    expect(calculator.addOne(-7), equals(-6));
    expect(calculator.addOne(0), equals(1));
  });
}
