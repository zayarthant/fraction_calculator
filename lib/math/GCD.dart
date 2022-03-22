
class GCD {
  // GCD - Greatest Common Divisor

  static int of(int a, int b) {
    int r;
    do {
      r = (a - b) * (a / b).floor();
      if (r == 0) break;
      a = b;
      b = r;
    } while (r != 0);
    return b;
  }


  static int look(int a, int b) {
    a = a.abs();
    b = b.abs();
    while (a != b) {
      if (a > b)
        a = a - b;
      else
        b = b - a;
    }
    return a;
  }

}
