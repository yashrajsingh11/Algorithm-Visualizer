import 'dart:async';
import 'dart:math';
import 'package:algori/enterTextField/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleShort extends StatefulWidget {
  @override
  _BubbleShortState createState() => _BubbleShortState();
}

class _BubbleShortState extends State<BubbleShort> {
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
  List<int> randomNumbers = [];
  int _sample = 180;
  List<int> numbersinput = [];
  StreamController<List<int>> _controller;
  Stream<List<int>> _stream;

  bool higherValue = false;
  bool graphVisual = false;
  bool showNumberInput = true;

  int loopi = 0;
  int loopj = 0;

  _randomNumbers() {
    if (randomNumbers.isEmpty) {
      for (int i = 0; i < _sample; i++) {
        randomNumbers.add(Random().nextInt(_sample));
      }
      _controller.add(randomNumbers);
    } else {
      randomNumbers = [];
      for (int i = 0; i < _sample; i++) {
        randomNumbers.add(Random().nextInt(_sample));
      }
      _controller.add(randomNumbers);
    }
  }

  _sort() async {
    if (higherValue == false) {
      for (int i = 0; i < numbersinput.length; i++) {
        for (int j = 0; j < (numbersinput.length - i - 1); j++) {
          if (numbersinput[j] > numbersinput[j + 1]) {
            int temp = numbersinput[j];
            numbersinput[j] = numbersinput[j + 1];
            numbersinput[j + 1] = temp;
          }
          await Future.delayed(Duration(milliseconds: 500));
          _controller.add(numbersinput);
        }
      }
    } else {
      for (int i = 0; i < randomNumbers.length; i++) {
        for (int j = 0; j < (randomNumbers.length - i - 1); j++) {
          if (randomNumbers[j] > randomNumbers[j + 1]) {
            int temp = randomNumbers[j];
            randomNumbers[j] = randomNumbers[j + 1];
            randomNumbers[j + 1] = temp;
          }
          await Future.delayed(Duration(microseconds: 20));
          _controller.add(randomNumbers);
        }
      }
    }
  }

  @override
  void initState() {
    _controller = StreamController();
    _stream = _controller.stream.asBroadcastStream();
    super.initState();
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    List<double> position = [
      MediaQuery.of(context).size.width * 0.25,
      MediaQuery.of(context).size.width * 0.35,
      MediaQuery.of(context).size.width * 0.45,
      MediaQuery.of(context).size.width * 0.55,
      MediaQuery.of(context).size.width * 0.65,
      MediaQuery.of(context).size.width * 0.75,
    ];
    // ignore: missing_return
    Color getColor(int number) {
      if (number < 10) {
        return Color(0xffBCD2E8);
      }
      if (number > 10 && number < 20) {
        return Color(0xff91BAD6);
      }
      if (number > 20 && number <= 25) {
        return Color(0xff73A5C6);
      }
      if (number > 25 && number <= 45) {
        return Color(0xff528AAE);
      }
      if (number > 45 && number <= 95) {
        return Color(0xff2E5984);
      }
      if (number > 95 && number <= 1000) {
        return Color(0xff1E3F66);
      }
    }

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Bubble Short"),
        trailing: higherValue && randomNumbers.isNotEmpty
            // ignore: deprecated_member_use
            ? FlatButton.icon(
                onPressed: _randomNumbers,
                icon: Icon(CupertinoIcons.refresh_thick),
                label: Text('Make New Data'))
            : SizedBox(),
      ),
      body: showNumberInput
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
                        numbersinput.add(int.parse(n1));
                        numbersinput.add(int.parse(n2));
                        numbersinput.add(int.parse(n3));
                        numbersinput.add(int.parse(n4));
                        numbersinput.add(int.parse(n5));
                        numbersinput.add(int.parse(n6));
                        setState(() {
                          showNumberInput = false;
                        });
                      } catch (e) {
                        print(e.message);
                      }
                    })
              ],
            )
          : !higherValue
              ? Container(
                  child: StreamBuilder<Object>(
                      stream: _stream,
                      builder: (context, snapshot) {
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 200,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: numbersinput.map((e) {
                                    int index = numbersinput.indexOf(e);
                                    return BubbleDigits(
                                        color: getColor(numbersinput[index]),
                                        numbers:
                                            numbersinput[index].toString());
                                  }).toList(),
                                ),
                              ),
                              Text(
                                "i = $loopi\nj = $loopj",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              : Container(
                  child: StreamBuilder<List<int>>(
                      stream: _stream,
                      builder: (context, snapshot) {
                        int counter = 0;
                        return Row(
                            children: randomNumbers.map((int e) {
                          counter++;
                          return CustomPaint(
                            painter: BarShow(
                              width:
                                  MediaQuery.of(context).size.width / _sample,
                              value: e,
                              index: counter,
                            ),
                          );
                        }).toList());
                      }),
                ),
      bottomNavigationBar: showNumberInput
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      color: CupertinoColors.systemRed,
                      child: Text("Sort"),
                      onPressed: _sort,
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CupertinoButton(
                      color: CupertinoColors.systemRed,
                      child: Text("Visualize On Higher Values"),
                      onPressed: () {
                        setState(() {
                          higherValue = true;
                          _randomNumbers();
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: higherValue
                        ? CupertinoButton(
                            color: CupertinoColors.systemRed,
                            child: Text("Visualize On Lower Values"),
                            onPressed: () {
                              setState(() {
                                higherValue = false;
                                randomNumbers = [];
                              });
                            },
                          )
                        : GestureDetector(
                            onTap: () {
                              if (loopi < numbersinput.length) {
                                if (numbersinput[loopj] >
                                    numbersinput[loopj + 1]) {
                                  int temp = numbersinput[loopj];
                                  numbersinput[loopj] = numbersinput[loopj + 1];
                                  numbersinput[loopj + 1] = temp;
                                }
                                setState(() {
                                  loopj++;
                                });
                              }
                              if (loopj >= numbersinput.length - 1) {
                                setState(() {
                                  loopi++;
                                  loopj = 0;
                                });
                              }
                            },
                            child: Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.075,
                              decoration: BoxDecoration(
                                color: CupertinoColors.systemRed,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Step wise Step",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                  Icon(
                                    CupertinoIcons.forward,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
    );
  }
}

class BarShow extends CustomPainter {
  final double width;
  final int value;
  final int index;

  BarShow({this.width, this.value, this.index});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (this.value < 10) {
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

class BubbleDigits extends StatelessWidget {
  final String numbers;
  final Color color;
  const BubbleDigits({Key key, this.color, this.numbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: color,
        child: Text(
          numbers,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
