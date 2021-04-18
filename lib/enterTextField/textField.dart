import 'package:flutter/cupertino.dart';

class EnterDigits extends StatelessWidget {
  final TextEditingController controller;

  const EnterDigits({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: CupertinoTextField(
        keyboardType: TextInputType.number,
        maxLength: 4,
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
