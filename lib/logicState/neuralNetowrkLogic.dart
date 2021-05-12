import 'package:flutter/cupertino.dart';
import 'dart:math' as mathX;
import 'package:vector_math/vector_math.dart';
class NeuralNetworkLogicxX extends ChangeNotifier{
  List<List<int>> inputs = [[0,0],[0,1],[1,0],[1,1]];
  List<double> weights = [0.2,0,0.3,0];
  List<int> outputs = [0,0,0,1];
  double sigmoidFN(int x)
  {
    return 1/(1 + mathX.exp(-x));
  }
  double summFn(List<int> x,List<int> w)
  {
    double sum = 0;
    for(int i = 0;i<x.length;i++)
      {
  //      sum = sum + x*w;
      }
  }

}