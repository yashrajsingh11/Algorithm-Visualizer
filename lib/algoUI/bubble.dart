import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble Sort',
      home: Scaffold(
        appBar: CupertinoNavigationBar(
          middle: Text('Bubble Sort'),
        ),
        body: Container(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
