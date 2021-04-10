import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlgoLabels extends StatelessWidget {
  final String algoName;

  const AlgoLabels({Key key, this.algoName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.25,
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.secondaryLabel,
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: Offset(0, 4),
            ),
          ]),
      child: Center(
          child: Text(
        algoName,
        style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02),
      )),
    );
  }
}
