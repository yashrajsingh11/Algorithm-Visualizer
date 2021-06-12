import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BinarySearchLogic extends ChangeNotifier {
  List<int> numbers = [];
  bool enternumbers = true;
  int searchKey = -1;
  int index = -1;
  String error = "";
  int rand = -1;

  //
  List<int> region = [0, 0, 0, 0, 0, 0];
  //

  Color activeArea = CupertinoColors.systemBlue;
  Color inactiveArea = CupertinoColors.systemGrey;
  Color defaultColor = CupertinoColors.systemTeal;
  void getInput(List<int> numb) {
    numbers = numb;
    numbers = numbers..sort();
    enternumbers = false;
    notifyListeners();
  }

  void verify(int ll) {
    for (var i = 0; i < numbers.length; i++) {
      if (numbers[i] != ll) {
        throw "Element Not Found";
      }
    }
  }

  Future<void> entertheKey(int key, BuildContext context) async {
    searchKey = key;
    error = "";
    index = -1;

    notifyListeners();
    Navigator.pop(context);
    await binarySearch(0, numbers.length - 1);
    if (index == -1) {
      error = "Search Element Not Found";
      notifyListeners();
      return;
    } else {
      error = " At $index Index and value ${numbers[index]}";
    }
    notifyListeners();
  }

  void getARandom() {
    rand = Random().nextInt(numbers.length);
    notifyListeners();
  }

  bool elemetFound = false;
  int mid = -1;
  int lower = 0;
  int upper = 6;
  Future<void> stepwisestep(int key) async {
    if (upper > lower) {
      mid = lower + (upper - lower) ~/ 2;
      for (var i = lower; i < upper; i++) {
        region[i] = 0;
      }
      if (numbers[mid] > key) {
        lower = lower;
        upper = mid;
        print(lower);
        print(upper);
        for (int i = lower; i < upper; i++) {
          region[i] = 1;
        }
        notifyListeners();
      } else if (numbers[mid] < key) {
        lower = mid;
        upper = upper;
        for (int i = lower; i < upper; i++) {
          region[i] = 1;
        }
        notifyListeners();
      } else {
        index = mid;
        elemetFound = true;
        region[index] = 1;
        notifyListeners();
      }
    }
    print(region);
  }

  Future<void> binarySearch(int lower, int upper) async {
    for (var i = 0; i < numbers.length; i++) {
      region[i] = 0;
      notifyListeners();
    }
    if (upper >= lower) {
      int mid = lower + (upper - lower) ~/ 2;
      if (numbers[mid] == searchKey) {
        index = mid;
        region[index] = 1;
        notifyListeners();
        return;
      } else if (numbers[mid] > searchKey) {
        binarySearch(lower, mid - 1);
      } else {
        binarySearch(mid + 1, upper);
      }
    }
  }
}
