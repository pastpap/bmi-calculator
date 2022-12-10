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
  NORMAL('Normalweight'),
  OVERWEIGHT('Overweight');

  const ResultType(this.value);
  final String value;
}
