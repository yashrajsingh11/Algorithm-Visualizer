// import 'package:flutter/cupertino.dart';
// import 'dart:math' as mathX;

// import 'package:vector_math/vector_math.dart';
// import 'package:vector_math/vector_math_64.dart';

// class NeuralNetworkLogicxX extends ChangeNotifier {
//   List<List<int>> inputs = [
//     [0, 0],
//     [0, 1],
//     [1, 0],
//     [1, 1]
//   ];

//   List<double> weights = [
//     mathX.Random().nextDouble(),
//     mathX.Random().nextDouble(),
//   ];
//   List<int> outputs = [0, 0, 0, 1];

//   double learning_rate = 0.1;

//   double sigmoidFN(double x) {
//     return 1 / (1 + mathX.exp(-x));
//   }

//   Future<void> runNetwork(int epochs) async {
//     int i = 0;
//     double error = 0;
//     while (i < epochs) {
//       for (int k = 0; k < outputs.length; k++) {
//         error = (outputs[k] - prediction(inputs[k], weights)).abs();
//         weights[0] = error * learning_rate;
//         notifyListeners();
//         await Future.delayed(Duration(milliseconds: 100));
//         weights[1] = error * learning_rate;
//         notifyListeners();
//         await Future.delayed(Duration(milliseconds: 100));
//       }
//       i++;
//     }
//   }

//   double prediction(List<int> x, List<double> w) {
//     double sunT = x[0] * w[0] + x[1] * w[1];
//     return sigmoidFN(sunT);
//   }
// }
