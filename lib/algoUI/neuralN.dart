import 'package:algori/logicState/neuralNetowrkLogic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NeuralNetUI extends StatelessWidget {
  bool higherValue = false;
  @override
  Widget build(BuildContext context) {
    final net = Provider.of<NeuralNetworkLogicxX>(context);
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Neural Network'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            Container(width: double.infinity),
            Row(
              children: [
                //Input Layer
                Expanded(
                    child: Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          child: Text(
                            net.inputs[0][0].toString(),
                            style: TextStyle(
                                fontSize: 48, color: CupertinoColors.black),
                          ),
                          backgroundColor: Colors.orange,
                          radius: 80),
                      CircleAvatar(
                          child: Text(
                            net.inputs[1][1].toString(),
                            style: TextStyle(
                                fontSize: 48, color: CupertinoColors.black),
                          ),
                          backgroundColor: Colors.orange,
                          radius: 80),
                    ],
                  ),
                )),
                //Hidden Layer
                Expanded(
                    child: Container(
                  // color: Colors.green,
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                          child: Text(
                            net.weights[0].toString(),
                            style: TextStyle(
                                fontSize: 28, color: CupertinoColors.black),
                          ),
                          backgroundColor: Colors.indigoAccent, radius: 45),
                      CircleAvatar(
                          child: Text(
                            net.weights[1].toString(),
                            style: TextStyle(
                                fontSize: 28, color: CupertinoColors.black),
                          ),
                          backgroundColor: Colors.indigoAccent, radius: 45),
                      CircleAvatar(
                          child: Text(
                            net.weights[2].toString(),
                            style: TextStyle(
                                fontSize: 28, color: CupertinoColors.black),
                          ),

                          backgroundColor: Colors.indigoAccent, radius: 45),
                      CircleAvatar(
                          child: Text(
                            net.weights[3].toString(),
                            style: TextStyle(
                                fontSize: 28, color: CupertinoColors.black),
                          ),
                          backgroundColor: Colors.indigoAccent, radius: 45),
                    ],
                  ),
                )),
                //Output Layer
                Expanded(
                    child: Container(
                  //color: Colors.blue,
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          child: Text(
                            net.outputs[0].toString(),
                            style: TextStyle(
                                fontSize: 48, color: CupertinoColors.black),
                          ),
                          backgroundColor: Colors.greenAccent,
                          radius: 100),
                    ],
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CupertinoButton(
                color: CupertinoColors.systemRed,
                child: Text("Run The Network"),
                onPressed: () => print(''),
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
              child: higherValue
                  ? CupertinoButton(
                      color: CupertinoColors.systemRed,
                      child: Text("Visualize On Lower Values"),
                      onPressed: () {},
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
