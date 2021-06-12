import 'package:flutter/cupertino.dart';

class HeapLogic extends ChangeNotifier {
  List<int> numbers = [1, 5, 6, 8, 9, 7, 3];
  List<int> nodeValue = [];
  List<int> array = [0, 0, 0, 0, 0, 0, 0];

  void init() {
    buildMaxHeap();
    notifyListeners();
  }

  void heapify(int i) async {
    int smallest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < numbers.length && numbers[l] > numbers[smallest]) {
      smallest = l;
    }

    if (r < numbers.length && numbers[r] > numbers[smallest]) {
      smallest = r;
    }

    if (smallest != i) {
      int temp = numbers[i];
      numbers[i] = numbers[smallest];
      numbers[smallest] = temp;
      await Future.delayed(Duration(milliseconds: 2000));
      notifyListeners();
      heapify(smallest);
    }
  }

  void buildMaxHeap() {
    for (int k = numbers.length; k >= 0; k--) {
      heapify(k);
    }
  }

  void heapSort() {}
}
