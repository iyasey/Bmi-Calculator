import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calculator_provider.g.dart';

@riverpod
class Calculator extends _$Calculator {
  @override
  CalculatorState build() => CalculatorState();

  void setHeight(int height) {
    state = state.copyWith(height: height);
  }

  void setWeight(int weight) {
    state = state.copyWith(weight: weight);
  }
  

  String calculateBmi() {
    double _bmi = state.weight / pow(state.height / 100, 2);
    state = state.copyWith(bmi: _bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (state.bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (state.bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (state.bmi >= 25) {
      return 'You can do more exercise';
    } else if (state.bmi > 18.5) {
      return 'Great job';
    } else {
      return 'You can eat more';
    }
  }
}

class CalculatorState {
  final int height;
  final int weight;
  final double bmi;

  CalculatorState({this.height = 180, this.weight = 55, this.bmi = 0.0});
  CalculatorState copyWith({int? height, int? weight, double? bmi}) {
    return CalculatorState(
        height: height ?? this.height,
        weight: weight ?? this.weight,
        bmi: bmi ?? this.bmi);
  }
}
