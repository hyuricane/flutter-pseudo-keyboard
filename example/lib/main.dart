import 'package:flutter/material.dart';
import 'package:pseudo_keyboard/pseudo_keyboard.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            KeyboardWidget(
              onKeyDown: (int keyCode, bool shift) {
                debugPrint("key down keyCode: $keyCode, shift: $shift");
              },
              onKeyUp: (int keyCode, bool shift, bool canceled) {
                debugPrint("key up keyCode: $keyCode, shift: $shift");
              },
            )
          ],
        ));
  }
}
