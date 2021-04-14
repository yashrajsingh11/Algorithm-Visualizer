import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MergeSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Merge Sort';
    return MaterialApp(
      title: 'Bubble Sort',
      home: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Merge Sort'),
        ),
        body: Container(
          color: Colors.redAccent,
        ),
      ),
    );
  }

}
