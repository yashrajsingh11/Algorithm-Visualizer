import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NeuralNetUI extends StatelessWidget {

  bool higherValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Neural Network'),
      ),
      body: ListView(
        children: [
          Container(width: double.infinity),
          Row(
            children: [
              //Input Layer
              Expanded(
                  child: Container(
                color: Colors.red,
                height: MediaQuery.of(context).size.height,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(backgroundColor: Colors.orange, radius: 100),
                    CircleAvatar(backgroundColor: Colors.orange, radius: 100),
                  ],
                ),
              )),
              //Hidden Layer
              Expanded(
                  child: Container(
                color: Colors.green,
                height: MediaQuery.of(context).size.height,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.indigoAccent, radius: 45),
                    CircleAvatar(
                        backgroundColor: Colors.indigoAccent, radius: 45),
                    CircleAvatar(
                        backgroundColor: Colors.indigoAccent, radius: 45),
                    CircleAvatar(
                        backgroundColor: Colors.indigoAccent, radius: 45),
                  ],
                ),
              )),
              //Output Layer
              Expanded(
                  child: Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height,
                width: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: Colors.greenAccent, radius: 100),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Sort"),
                onPressed: ()=>print(''),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Visualize On Higher Values"),
                onPressed: () {
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

                },
              )

              ),
            ),
          ],
        ),
      ),
    );
  }
}
