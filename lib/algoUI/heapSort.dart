import 'package:algori/logicState/heapLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeapSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Color> _colors = [
      Colors.pinkAccent,
      Colors.teal,
      Colors.yellow,
      Colors.green,
      Colors.redAccent,
      Colors.purple,
      Colors.blue,
    ];
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Heap Short"),
      ),
      backgroundColor: Colors.white,
      body: Consumer<HeapLogic>(
        builder: (context, logic, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: deprecated_member_use
              FlatButton.icon(
                  onPressed: () => logic.buildMaxHeap(),
                  icon: Icon(CupertinoIcons.refresh_thick),
                  label: Text('Make New Data')),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Node(
                  colors: _colors[0],
                  numberX: logic.numbers[0],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Node(
                      colors: _colors[1],
                      numberX: logic.numbers[1],
                    ),
                    SizedBox(width: 180),
                    Node(
                      colors: _colors[2],
                      numberX: logic.numbers[2],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Node(
                          colors: _colors[3],
                          numberX: logic.numbers[3],
                        ),
                        SizedBox(width: 50),
                        Node(
                          colors: _colors[4],
                          numberX: logic.numbers[4],
                        ),
                      ],
                    ),
                    SizedBox(width: 90),
                    Row(
                      children: [
                        Node(numberX: logic.numbers[5], colors: _colors[5]),
                        SizedBox(width: 50),
                        Node(
                          colors: _colors[6],
                          numberX: logic.numbers[6],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Node extends StatelessWidget {
  Node({
    Key key,
    @required this.numberX,
    @required this.colors,
  });

  final Color colors;
  final int numberX;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: colors,
      child: Text(numberX.toString()),
    );
  }
}
