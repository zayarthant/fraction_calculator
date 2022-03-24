import 'package:fraction/math/Fraction.dart';

void main() {
  Fraction first =  Fraction(numerator: 1, denominator: 1);
  Fraction second = Fraction(numerator: 2, denominator: 3);

  print(first.multi(second));
}
