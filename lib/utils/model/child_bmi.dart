class ChildBmi {
  final int age;
  final List<double> limits;

  ChildBmi(this.age, this.limits);

  ChildBmi.fromJson(Map<String, dynamic> json)
      : age = json['age'] as int,
        limits = limitsFromJson(json['limits']);

  static List<double> limitsFromJson(List<dynamic> jsonList) {
    return jsonList.map((e) => e as double).toList();
  }
}
