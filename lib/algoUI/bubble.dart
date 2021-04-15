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
    addressAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
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

  int i = 0;
  int j = 1;
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
  List<int> numbersinput = [23, 342, 22, 3, 56, 8];

  double _opa = 0;
  bool showText = true;
  bool shortDone = false;
  int loop1 = 0;
  int loop2 = 0;
  String swwwp = "";
  @override
  Widget build(BuildContext context) {
    List<double> position = [
      MediaQuery.of(context).size.width * 0.25,
      MediaQuery.of(context).size.width * 0.35,
      MediaQuery.of(context).size.width * 0.45,
      MediaQuery.of(context).size.width * 0.55,
      MediaQuery.of(context).size.width * 0.65,
      MediaQuery.of(context).size.width * 0.75,
    ];
    var tweenValue = addressAnimation.value ?? 0.0;
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
                ? Column(children: [
                    Container(width: double.infinity),
                    Container(
                      height: 120,
                      child: Center(
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              BubbleDigits(
                                numbers: numbersinput[0].toString(),
                              ),
                              BubbleDigits(
                                numbers: numbersinput[1].toString(),
                              ),
                              BubbleDigits(
                                numbers: numbersinput[2].toString(),
                              ),
                              BubbleDigits(
                                numbers: numbersinput[3].toString(),
                              ),
                              BubbleDigits(
                                numbers: numbersinput[4].toString(),
                              ),
                              BubbleDigits(
                                numbers: numbersinput[5].toString(),
                              ),
                            ]),
                      ),
                    )
                  ])
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
            //     ? CupertinoButton(
            //         color: Colors.black,
            //         child: Text("Done"),
            //         onPressed: () {
            //           try {
            //             validate(n1, n2, n3, n4, n5, n6);
            //             numbersinput.add(int.parse(n1));
            //             numbersinput.add(int.parse(n2));
            //             numbersinput.add(int.parse(n3));
            //             numbersinput.add(int.parse(n4));
            //             numbersinput.add(int.parse(n5));
            //             numbersinput.add(int.parse(n6));
            //             setState(() {
            //               showText = false;
            //               _opa = 1;
            //             });
            //           } catch (e) {
            //             print(e.message);
            //           }
            //         })
            //     :
            // !shortDone
            //     ?

            CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Sort"),
                onPressed: () {
                  setState(() {
                    i = 0;
                    j = 1;
                  });
                  int temp = 0;
                  for (i = 0; i < numbersinput.length - 1; i++) {
                    for (j = 1; j < (numbersinput.length - i); j++) {
                      if (numbersinput[j - 1] > numbersinput[j]) {
                        temp = numbersinput[j - 1];
                        numbersinput[j - 1] = numbersinput[j];
                        numbersinput[j] = temp;
                      }
                    }
                  }
                  setState(() {
                    shortDone = true;

                    swwwp = "Last Swap Done at i = $i j =  $j";
                  });
                }),
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // IconButton(
                  //     icon: Icon(
                  //       CupertinoIcons.back,
                  //       color: Colors.black,
                  //       size: 50,
                  //     ),
                  //     onPressed: () {
                  //       int te = 0;
                  //       j > 1
                  //           ? setState(() {
                  //               j--;
                  //               swapped
                  //                   ? controller.reverse()
                  //                   : controller.forward();
                  //               if (numbersinput[j + 1] < numbersinput[j]) {
                  //                 te = numbersinput[j];
                  //                 numbersinput[j] = numbersinput[j + 1];
                  //                 numbersinput[j + 1] = te;
                  //               }
                  //             })
                  //           : j = j;
                  //     }),

                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("i = $i"),
                            SizedBox(width: 10),
                            Text("j = $j"),
                          ],
                        ),
                        Text(swwwp),
                      ]),

                  SizedBox(width: 20),
                  CupertinoButton(
                      color: Colors.black,
                      child: Icon(
                        CupertinoIcons.forward,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        int te = 0;
                        if (j == numbersinput.length &&
                            i < numbersinput.length) {
                          i++;
                          j = 1;
                        } else {
                          numbersinput.length > j
                              ? setState(() {
                                  if (numbersinput[j - 1] > numbersinput[j]) {
                                    te = numbersinput[j - 1];
                                    numbersinput[j - 1] = numbersinput[j];
                                    numbersinput[j] = te;
                                    swwwp = "Swap Done at i = $i j =  $j";
                                  }
                                  j++;
                                })
                              : j = j;
                        }
                      }),
                ],
              ),
            ),

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
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: CircleAvatar(
        radius: 50,
        backgroundColor: Colors.black,
        child: Text(
          numbers,
          style: TextStyle(color: Colors.white),
        ),
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
// Positioned(
//   top: 20,
//   left: np1 + tweenValue,
//   child: BubbleDigits(
//     numbers: numbersinput[0].toString(),
//   ),
// ),
// Positioned(
//   top: 20,
//   left: np2 - tweenValue,
//   child: BubbleDigits(
//     numbers: numbersinput[1].toString(),
//   ),
// ),
// Positioned(
//   top: 20,
//   left: np3 - tweenValue,
//   child: BubbleDigits(
//     numbers: numbersinput[2].toString(),
//   ),
// ),
