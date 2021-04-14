import 'package:algori/algoUI/Merge.dart';
import 'package:algori/algoUI/bubble.dart';
import 'package:algori/algoUI/quick.dart';
import 'package:algori/widgets/algoLabel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _change = true;
  @override
  Widget build(BuildContext context) {
    return _change
        ? Scaffold(
            appBar: CupertinoNavigationBar(
              middle: Text("Algo"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome To The World Of Algo",
                  ),
                  CupertinoButton(
                      child: Text("Start"),
                      onPressed: () {
                        setState(() {
                          _change = false;
                        });
                      })
                ],
              ),
            ),
          )
        : AlgoOptions();
  }
}

class AlgoOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Select An Algo"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => BubbleSort(),
                    ),
                  ),
                  child: AlgoLabels(
                    algoName: "Bubble Sort",
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => QuickSort(),
                    ),
                  ),
                  child: AlgoLabels(
                    algoName: "Quick Sort",
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => MergeSort(),
                    ),
                  ),
                  child: AlgoLabels(
                    algoName: "Merge Sort",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
