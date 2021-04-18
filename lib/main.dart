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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: MyHomePage(),
      //home: BubbleShort(),
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
                      builder: (context) => BubbleShort(),
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
