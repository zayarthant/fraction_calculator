import 'package:fraction/math/GCD.dart';

class Fraction {
  final int numerator, denominator;

  Fraction({required this.numerator, required this.denominator});

  Fraction sub(Fraction b) {
    return subtract(this, b);
  }

  static Fraction subtract(Fraction a, Fraction b) {
    if (a.denominator != b.denominator) {
      final int aD = a.denominator;
      a = alignment(a, b.denominator);
      b = alignment(b, aD);
    }
    return Fraction(
        numerator: a.numerator - b.numerator, denominator: a.denominator);
  }

  Fraction add(Fraction b) {
    return addition(this, b);
  }

  static Fraction addition(Fraction a, Fraction b) {
    if (a.denominator != b.denominator) {
      final int aD = a.denominator;
      a = alignment(a, b.denominator);
      b = alignment(b, aD);
    }
    return Fraction(
        numerator: a.numerator + b.numerator, denominator: a.denominator);
  }

  Fraction multi(Fraction b) {
    return multiply(this, b);
  }

  static Fraction multiply(Fraction a, Fraction b) {
    return Fraction(
        numerator: a.numerator * b.numerator,
        denominator: a.denominator * b.denominator);
  }

  Fraction div(Fraction b) {
    return divide(this, b);
  }

  static Fraction divide(Fraction a, Fraction b) {
    return multiply(
        a, Fraction(numerator: b.denominator, denominator: b.numerator));
  }

  Fraction align(int base) {
    return alignment(this, base);
  }

  static Fraction alignment(Fraction a, int base) {
    return Fraction(
        numerator: a.numerator * base, denominator: a.denominator * base);
  }

  Fraction simple() {
    return simplify(this);
  }

  static Fraction simplify(Fraction f) {
    int gcd = GCD.of(f.numerator, f.denominator);
    if (gcd != 1) {
      int numerator = (f.numerator / gcd) as int;
      int denominator = (f.denominator / gcd) as int;
      return Fraction(numerator: numerator, denominator: denominator);
    }
    return f;
  }

  @override
  String toString() {
    return ' $numerator/$denominator ';
  }
}
