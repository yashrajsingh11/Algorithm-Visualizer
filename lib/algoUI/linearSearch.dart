import 'dart:async';
import 'dart:math';

import 'package:algori/enterTextField/textField.dart';
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
  List<int> _numbers = [];
  String _success = "";
  String _error = "";
  Color _colorsX = CupertinoColors.systemPurple;
  int _index = 0;
  int _foundIndex;
  List<int> _randomNumbersX = [];
  int _sample = 20;
  bool _higherValue = false;
  bool _showNumberInput = true;

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
      body: _showNumberInput
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter the Digits",
                  style: TextStyle(fontSize: 38, color: Colors.black),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EnterDigits(controller: _input1),
                    EnterDigits(controller: _input2),
                    EnterDigits(controller: _input3),
                    EnterDigits(controller: _input4),
                    EnterDigits(controller: _input5),
                    EnterDigits(controller: _input6),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                CupertinoButton(
                    color: Colors.black,
                    child: Text("Done"),
                    onPressed: () {
                      try {
                        validate(n1, n2, n3, n4, n5, n6);
                        _numbers.add(int.parse(n1));
                        _numbers.add(int.parse(n2));
                        _numbers.add(int.parse(n3));
                        _numbers.add(int.parse(n4));
                        _numbers.add(int.parse(n5));
                        _numbers.add(int.parse(n6));
                        setState(() {
                          _showNumberInput = false;
                        });
                      } catch (e) {
                        print(e.message);
                      }
                    })
              ],
            )
          : !_higherValue
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
                                        radius: 25,
                                        backgroundColor: _colorsX,
                                        child: Text(
                                          searchInteger,
                                          style: TextStyle(
                                              color: _foundIndex == ix
                                                  ? CupertinoColors.white
                                                  : CupertinoColors.black),
                                        ),
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
              : Container(child: Consumer<LinearSearchLogicManagement>(
                  builder: (context, _, child) {
                    int counter = 0;
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
      bottomNavigationBar: _showNumberInput
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  !_higherValue
                      ? Expanded(
                          child: CupertinoButton(
                            color: CupertinoColors.systemRed,
                            child: Text("Search"),
                            onPressed: _takeSearch,
                          ),
                        )
                      : Expanded(
                          child: CupertinoButton(
                            color: CupertinoColors.systemRed,
                            child: Text("Search"),
                            onPressed: () =>
                                linearXTransform.linearLogic(_randomNumbersX),
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
                              _linearSearch();
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
