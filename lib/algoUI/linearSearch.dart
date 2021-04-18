import 'dart:async';
import 'dart:math';

import 'package:algori/logicState/linearSearchLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LinearSearchUIX extends StatefulWidget {
  @override
  _LinearSearchUIXState createState() => _LinearSearchUIXState();
}

class _LinearSearchUIXState extends State<LinearSearchUIX> {
  //
  TextEditingController _input1 = TextEditingController();
  TextEditingController _input2 = TextEditingController();
  TextEditingController _input3 = TextEditingController();
  TextEditingController _input4 = TextEditingController();
  TextEditingController _input5 = TextEditingController();
  TextEditingController _input6 = TextEditingController();
  String get n1 => _input1.text;
  String get n2 => _input2.text;
  String get n3 => _input3.text;
  String get n4 => _input4.text;
  String get n5 => _input5.text;
  String get n6 => _input6.text;
  //
  TextEditingController _getSearchValue = TextEditingController();
  String searchInteger = "";
  List<int> _numbers = [122, 23, 4, 53, 5, 4];
  String _success = "";
  String _error = "";
  Color _colorsX = CupertinoColors.systemPurple;
  int _index = 0;
  int _foundIndex;
  List<int> _randomNumbersX = [];
  int _sample = 200;
  bool _higherValue = false;

  _randomNumber() {
    if (_randomNumbersX.isEmpty) {
      for (int i = 0; i < _sample; i++) {
        _randomNumbersX.add(Random().nextInt(_sample));
      }
    } else {
      _randomNumbersX = [];
      for (int i = 0; i < _sample; i++) {
        _randomNumbersX.add(Random().nextInt(_sample));
      }
    }
  }

  _linearSearch() async {
    for (int i = 0; i < _numbers.length; i++) {
      setState(() {
        _index = i;
      });
      if (_numbers[i] == int.parse(searchInteger)) {
        setState(() {
          _success = "${_numbers[i]} Found At the ${i + 1} in the Collection";
          _colorsX = CupertinoColors.activeGreen;
          _foundIndex = i;
        });
        return;
      }
      await Future.delayed(Duration(milliseconds: 600));
    }

    setState(() {
      _error = "No element found";
    });
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    final linearXTransform =
        Provider.of<LinearSearchLogicManagement>(context, listen: false);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Linear Search"),
        trailing: !linearXTransform.processing && _higherValue
            // ignore: deprecated_member_use
            ? FlatButton.icon(
                onPressed: _randomNumber,
                icon: Icon(CupertinoIcons.refresh_thick),
                label: Text('Make New Data'))
            : !_higherValue
                ? SizedBox()
                : CupertinoActivityIndicator(),
      ),
      body: !_higherValue
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _numbers.length,
                    itemBuilder: (context, ix) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: _foundIndex == ix
                                  ? CupertinoColors.activeGreen
                                  : CupertinoColors.activeOrange,
                              child: Text(
                                _numbers[ix].toString(),
                                style: TextStyle(
                                    color: _foundIndex == ix
                                        ? CupertinoColors.white
                                        : CupertinoColors.black),
                              ),
                            ),
                            SizedBox(height: 10),
                            _index == ix
                                ? CircleAvatar(
                                    radius: 5,
                                    backgroundColor: _colorsX,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text(_success),
                Text(_error),
              ],
            )
          : Container(child: Consumer(
              builder: (context, _, child) {
                return Row(
                    children: _randomNumbersX.map((int e) {
                  counter++;
                  return CustomPaint(
                    painter: BARLinearSearch(
                      finalAnswer: linearXTransform.finalanswer ?? -1,
                      width: MediaQuery.of(context).size.width / _sample,
                      value: e,
                      index: counter,
                    ),
                  );
                }).toList());
              },
            )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Search"),
                onPressed: _takeSearch,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Visualize On Higher Values"),
                onPressed: () {
                  setState(() {
                    _higherValue = true;
                    print("Iananw");
                    _randomNumber();
                  });
                },
              ),
            ),
            SizedBox(width: 20),
            !_higherValue
                ? Expanded(
                    child: CupertinoButton(
                      color: CupertinoColors.systemRed,
                      child: Text("Search For Values"),
                      onPressed: () {
                        setState(() {
                          _error = "";
                        });
                        !_higherValue
                            ? _linearSearch()
                            : linearXTransform.linearLogic(_randomNumbersX);
                      },
                    ),
                  )
                : CupertinoButton(
                    color: CupertinoColors.systemRed,
                    child: Text("Visualize On Lower Values"),
                    onPressed: () {
                      setState(() {
                        _higherValue = false;
                        _randomNumbersX = [];
                      });
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> _takeSearch() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoDialogAction(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: CupertinoColors.systemGrey4.withOpacity(0.4),
                      spreadRadius: 4.0,
                      blurRadius: 1.0,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          child: Icon(CupertinoIcons.clear),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    CupertinoTextField(
                      controller: _getSearchValue,
                    ),
                    SizedBox(height: 20),
                    CupertinoButton(
                        color: CupertinoColors.black,
                        child: Text("Done"),
                        onPressed: () {
                          setState(() {
                            searchInteger = _getSearchValue.text;
                          });
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class BARLinearSearch extends CustomPainter {
  final double width;
  final int value;
  final int index;
  final int finalAnswer;

  BARLinearSearch({this.width, this.finalAnswer, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (this.value == finalAnswer) {
      paint.color = Colors.red;
    }
    if (this.value < 10 && this.value > 0) {
      paint.color = Color(0xffBCD2E8);
    }
    if (this.value > 10 && this.value < 20) {
      paint.color = Color(0xff91BAD6);
    }
    if (this.value > 20 && this.value <= 25) {
      paint.color = Color(0xff73A5C6);
    }
    if (this.value > 25 && this.value <= 45) {
      paint.color = Color(0xff528AAE);
    }
    if (this.value > 45 && this.value <= 95) {
      paint.color = Color(0xff2E5984);
    }
    if (this.value > 95 && this.value <= 1000) {
      paint.color = Color(0xff1E3F66);
    }

    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(index * width, 0),
        Offset(index * width, value.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
