import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Quick Sort'),
        ),
        body: Container(
          color: Colors.redAccent,
        ),
    );
  }
}
