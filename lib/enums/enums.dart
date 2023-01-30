enum Gender {
  MALE,
  FEMALE,
}

enum Routes {
  INPUT('/'),
  RESULT('/result');

  const Routes(this.value);
  final String value;
}

enum ResultType {
  UNDERWEIGHT('Underweight'),
  NORMAL('Normal'),
  AT_RISK('At Risk'),
  OVERWEIGHT('Overweight');

  const ResultType(this.value);
  final String value;
}
