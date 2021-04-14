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
  List<int> numbersinput = [];
  double _opa = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(width: double.infinity),
            Text(
              "Enter the Digits",
              style: TextStyle(fontSize: 38, color: Colors.white),
            ),
            SizedBox(height: 50),
            numbersinput.isNotEmpty
                ? AnimatedOpacity(
                    opacity: _opa,
                    duration: Duration(milliseconds: 400),
                    child: BubbleDigits(
                      numbers: n1,
                    ),
                  )
                : Text(''),
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
            SizedBox(height: 50),
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
                      _opa = 1;
                    });
                  } catch (e) {
                    print(e.message);
                  }
                })
          ],
        ),
      ),
    );
  }
}

class BubbleDigits extends StatelessWidget {
  final String numbers;

  const BubbleDigits({Key key, this.numbers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(child: Text(numbers));
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
        maxLength: 1,
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
