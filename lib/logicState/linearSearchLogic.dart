import 'package:flutter/cupertino.dart';

class LinearSearchLogicManagement extends ChangeNotifier {
  bool processing = false;
  int finalanswer = -1;

  void linearLogic(List<int> randomNumbersX) async {
    processing = true;
    notifyListeners();
    int _element = (randomNumbersX..shuffle()).first;
    for (int i = 0; i < randomNumbersX.length; i++) {
      if (randomNumbersX[i] == _element) {
        finalanswer = randomNumbersX[i];
        processing = false;
        notifyListeners();
        return;
      }
      await Future.delayed(Duration(microseconds: 20));
    }
  }
}
