import 'dart:convert';

import 'package:bmi_calculator/utils/model/child_bmi.dart';
import 'package:flutter/services.dart';

class InitialDataLoader {
  late List<ChildBmi> boysBmiLimits = [];
  late List<ChildBmi> girlsBmiLimits = [];

  InitialDataLoader() {
    _loadBmiDataFromJson();
  }

  Future<void> _loadBmiDataFromJson() async {
    final String response =
        await rootBundle.loadString('assets/json/bmi_children.json');
    final data = json.decode(response.toString());
    var boys = data["boys"] as List;
    boysBmiLimits = boys.map((child) => ChildBmi.fromJson(child)).toList();
    var girls = data["girls"] as List;
    girlsBmiLimits = girls.map((child) => ChildBmi.fromJson(child)).toList();
  }
}
