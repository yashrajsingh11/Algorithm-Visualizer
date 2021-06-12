import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class BinarySearchLogic extends ChangeNotifier {
  List<int> numbers = [1, 3, 7, 12, 45, 645];
  bool enternumbers = false;
  int searchKey = -1;
  int index = -1;

  //
  List<int> region = [0, 0, 0, 0, 0, 0];
  //

  Color activeArea = CupertinoColors.systemTeal;
  Color inactiveArea = CupertinoColors.systemGrey;
  Color defaultColor = CupertinoColors.activeBlue;
  void getInput(List<int> numb) {
    numbers = numb;
    enternumbers = false;
    notifyListeners();
  }

  Future<void> entertheKey(int key) async {
    searchKey = key;
    await binarySearch(0, numbers.length);
    print("this is Index $index and value ${numbers[index]}");
    notifyListeners();
  }

  int lower = 0;
  int upper = 6;
  Future<void> stepwisestep(int key) async {

    int mid = lower + (upper - lower) ~/ 2;
    if (numbers[mid] > key) {
      lower = mid + 1;
      upper = upper;
      
      notifyListeners();
      for (int i = lower; i < upper; i++) {
        region[i] = 1;
        notifyListeners();
      }
    } else if (numbers[mid] < key) {
      lower = lower;
      upper = mid - 1;
      notifyListeners();
      for (int i = lower; i < upper; i++) {
        region[i] = 1;
        notifyListeners();
      }
    } else {
      index = mid;
      region[index] = 1;
      notifyListeners();
    }
  }

  Future<void> binarySearch(int lower, int upper) async {
    if (upper > lower) {
      int mid = lower + (upper - lower) ~/ 2;
      if (numbers[mid] < searchKey) {
        binarySearch(lower, mid - 1);
      } else if (numbers[mid] > searchKey) {
        binarySearch(mid + 1, upper);
      } else {
        index = mid;
        region[index] = 1;
        notifyListeners();
      }
    }
  }
}
