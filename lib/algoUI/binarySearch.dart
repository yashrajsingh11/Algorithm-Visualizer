import 'package:algori/enterTextField/textField.dart';
import 'package:algori/logicState/binarySearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class BinarySearchUIX extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    final binaryLogic = Provider.of<BinarySearchLogic>(context);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Binary Search"),
      ),
      body: binaryLogic.enternumbers
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
                        List<int> _numbersinput = [];
                        _numbersinput.add(int.parse(n1));
                        _numbersinput.add(int.parse(n2));
                        _numbersinput.add(int.parse(n3));
                        _numbersinput.add(int.parse(n4));
                        _numbersinput.add(int.parse(n5));
                        _numbersinput.add(int.parse(n6));
                        binaryLogic.numbers.clear();
                        binaryLogic.getInput(_numbersinput);
                      } catch (e) {
                        print(e.message);
                      }
                    })
              ],
            )
          : Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: binaryLogic.numbers.map(
                        (e) {
                          int index = binaryLogic.numbers.indexOf(e);
                          return Container(
                            height: 200,
                            width: 200,
                            child: CircleAvatar(
                              backgroundColor: binaryLogic.region[index] == 0
                                  ? binaryLogic.inactiveArea
                                  : binaryLogic.activeArea,
                              child:
                                  Text(binaryLogic.numbers[index].toString()),
                            ),
                            color: Colors.red,
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: binaryLogic.enternumbers
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      color: CupertinoColors.systemRed,
                      child: Text("Search"),
                      onPressed: () async {
                        await binaryLogic.entertheKey(1);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CupertinoButton(
                      color: CupertinoColors.systemRed,
                      child: Text("Visualize On Higher Values"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: binaryLogic.enternumbers
                        ? CupertinoButton(
                            color: CupertinoColors.systemRed,
                            child: Text("Visualize On Lower Values"),
                            onPressed: () {},
                          )
                        : GestureDetector(
                            onTap: () {
                              binaryLogic.stepwisestep(1);
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
