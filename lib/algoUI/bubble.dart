import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BubbleShort extends StatefulWidget {
  @override
  _BubbleShortState createState() => _BubbleShortState();
}

class _BubbleShortState extends State<BubbleShort>
    with TickerProviderStateMixin {
  final double np1 = 20;
  final double np2 = 150;
  final double np3 = 250;
  bool swapped = false;
  Animation<double> addressAnimation;
  AnimationController controller;
  animationListener() => setState(() {});

  @override
  void didChangeDependencies() async {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    addressAnimation = Tween(begin: 0.0, end: np3 - np2).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.easeInOut)))
      ..addListener(animationListener);
    super.didChangeDependencies();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

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
  List<int> numbersinput = [21, 4, 34];
  double _opa = 0;
  bool showText = true;
  bool shortDone = false;

  @override
  Widget build(BuildContext context) {
    var tweenValue = addressAnimation?.value ?? 0.0;

    return Scaffold(
      body: Container(
        color: CupertinoColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            // showText
            //     ? Text(
            //         "Enter the Digits",
            //         style: TextStyle(fontSize: 38, color: Colors.white),
            //       )
            //     : Text(''),
            SizedBox(height: 50),
            numbersinput.isNotEmpty
                ? Container(
                    height: 200,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: np1 + tweenValue,
                          child: BubbleDigits(
                            numbers: numbersinput[0].toString(),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: np2 + tweenValue,
                          child: BubbleDigits(
                            numbers: numbersinput[1].toString(),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: np3 - tweenValue,
                          child: BubbleDigits(
                            numbers: numbersinput[2].toString(),
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(''),
            // showText
            //     ? Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           EnterDigits(controller: _input1),
            //           EnterDigits(controller: _input2),
            //           EnterDigits(controller: _input3),
            //           EnterDigits(controller: _input4),
            //           EnterDigits(controller: _input5),
            //           EnterDigits(controller: _input6),
            //         ],
            //       )
            //     : SizedBox(),
            // SizedBox(height: 50),
            // showText
            //     ?

            // CupertinoButton(
            //     color: Colors.black,
            //     child: Text("Done"),
            //     onPressed: () {
            //       try {
            //         validate(n1, n2, n3, n4, n5, n6);
            //         numbersinput.add(int.parse(n1));
            //         numbersinput.add(int.parse(n2));
            //         numbersinput.add(int.parse(n3));
            //         numbersinput.add(int.parse(n4));
            //         numbersinput.add(int.parse(n5));
            //         numbersinput.add(int.parse(n6));
            //         setState(() {
            //           showText = false;
            //           _opa = 1;
            //         });
            //       } catch (e) {
            //         print(e.message);
            //       }
            //     }),
            //    :
            // !shortDone
            //     ?
            CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Sort"),
                onPressed: () {
                  int temp = 0;
                  for (int i = 0; i < numbersinput.length - 1; i++) {
                    for (int j = 1; j < (numbersinput.length - i); j++) {
                      if (numbersinput[j - 1] > numbersinput[j]) {
                        setState(() {
                          swapped ? controller.reverse() : controller.forward();
                          swapped = !swapped;
                        });
                        // temp = numbersinput[j - 1];
                        // numbersinput[j - 1] = numbersinput[j];
                        // numbersinput[j] = temp;

                      }
                    }
                  }
                  setState(() {
                    shortDone = true;
                  });
                })
            // : CupertinoButton(
            //     color: CupertinoColors.black,
            //     child: Text("Done"),
            //     onPressed: () {
            //       setState(() {
            //         numbersinput.clear();
            //         _input1.clear();
            //         _input2.clear();
            //         _input3.clear();
            //         _input4.clear();
            //         _input5.clear();
            //         _input6.clear();
            //       });

            //       Navigator.pop(context);
            //     }),
          ],
        ),
      ),
    );
    /*  return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 200,
            width: 500,
            child: Stack(
              children: <Widget>[
                // Top address
                Positioned(
                  top: 20,
                  left: n2 + tweenValue,
                  child: AnimatedOpacity(
                    opacity: _opa,
                    curve: Curves.decelerate,
                    duration: Duration(milliseconds: 4000),
                    child: BubbleDigits(
                      numbers: numbersinput[0].toString(),
                    ),
                  ),
                ),
                // Bottom address
                Positioned(
                  top: 20,
                  left: n1 - tweenValue,
                  child: Text("This is another address"),
                ),
                // Swap button
                Positioned(
                  top: 150,
                  right: 20,
                  child: FlatButton(
                    onPressed: () => setState(() {
                      swapped ? controller.reverse() : controller.forward();
                      swapped = !swapped;
                    }),
                    child: Text("swap"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    */
  }
}

class BubbleDigits extends StatelessWidget {
  final String numbers;

  const BubbleDigits({Key key, this.numbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Colors.black,
      child: Text(
        numbers,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class EnterDigits extends StatelessWidget {
  final TextEditingController controller;

  const EnterDigits({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        maxLength: 3,
        textAlign: TextAlign.center,
        controller: controller,
      ),
    );
  }
}

void validate(
    String n1, String n2, String n3, String n4, String n5, String n6) {
  if (n1.isEmpty ||
      n2.isEmpty ||
      n3.isEmpty ||
      n4.isEmpty ||
      n5.isEmpty ||
      n6.isEmpty) {
    throw Exception("Please Enter The Numbers");
  }
}
