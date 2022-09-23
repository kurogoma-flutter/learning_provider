import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  //　状態管理をする数字
  int counterA = 0;
  int counterB = 0;
  int counterC = 0;

  /// counterAを増やす
  void incrementA() {
    counterA++;
    notifyListeners();
  }

  /// counterBを増やす
  void incrementB() {
    counterB++;
  }

  /// counterCを増やす
  void incrementC() {
    counterC++;
    notifyListeners();
  }
}
