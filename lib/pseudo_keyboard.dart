library pseudo_keyboard;

import 'package:flutter/material.dart';

enum KeyboardState { DEFAULT, SHIFT, CAPSLOCK, SYMBOLS }

class KeyboardKeyWidget extends StatelessWidget {
  final int keyCode;
  final bool shift;
  final String text;
  final Icon icon;
  final int flex;
  final void Function(int keyCode, bool shift) onPressed;

  KeyboardKeyWidget({this.keyCode, this.text, this.icon, this.onPressed, this.flex = 1, this.shift = false});

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return new Expanded(
        child: new Container(
          child: new IconButton(
            color: Color.fromARGB(255, 238, 238, 238),
            icon: icon,
            padding: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
            onPressed: () => this.onPressed(keyCode, shift),
          ),
          margin: EdgeInsets.all(1.0),
        ),
        flex: flex,
      );
    } else {
      return new Expanded(
        child: new Container(
          child: new MaterialButton(
            color: Color.fromARGB(255, 238, 238, 238),
            child: new Text(text),
            padding: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
            onPressed: () => this.onPressed(keyCode, shift),
          ),
          margin: EdgeInsets.all(1.0),
        ),
        flex: flex,
      );
    }
  }
}

class KeyboardWidget extends StatefulWidget {
  final KeyboardState keyboardState;
  final Function(int keyCode, bool isShift) onPress;

  KeyboardWidget({this.keyboardState = KeyboardState.DEFAULT, this.onPress});

  @override
  State<StatefulWidget> createState() {
    return new _KeyboardState(keyboardState: this.keyboardState, onPress: this.onPress);
  }
}

class _KeyboardState extends State<KeyboardWidget> {
  KeyboardState keyboardState;
  int symbolPage = 0;
  final Function(int keyCode, bool isShift) onPress;

  _KeyboardState({this.keyboardState, this.onPress});

  @override
  Widget build(BuildContext context) {
    switch (keyboardState) {
      case KeyboardState.SHIFT:
        return buildShift(context);
        break;
      case KeyboardState.CAPSLOCK:
        return buildShift(context);
        break;
      case KeyboardState.SYMBOLS:
        return buildSymbol(context);
      default:
        return buildDefault(context);
        break;
    }
  }

  Widget buildDefault(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(2.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "1", keyCode: 8, onPressed: keyPress),
              new KeyboardKeyWidget(text: "2", keyCode: 9, onPressed: keyPress),
              new KeyboardKeyWidget(text: "3", keyCode: 10, onPressed: keyPress),
              new KeyboardKeyWidget(text: "4", keyCode: 11, onPressed: keyPress),
              new KeyboardKeyWidget(text: "5", keyCode: 12, onPressed: keyPress),
              new KeyboardKeyWidget(text: "6", keyCode: 13, onPressed: keyPress),
              new KeyboardKeyWidget(text: "7", keyCode: 14, onPressed: keyPress),
              new KeyboardKeyWidget(text: "8", keyCode: 15, onPressed: keyPress),
              new KeyboardKeyWidget(text: "9", keyCode: 16, onPressed: keyPress),
              new KeyboardKeyWidget(text: "0", keyCode: 7, onPressed: keyPress),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "q", keyCode: 45, onPressed: keyPress),
              new KeyboardKeyWidget(text: "w", keyCode: 51, onPressed: keyPress),
              new KeyboardKeyWidget(text: "e", keyCode: 33, onPressed: keyPress),
              new KeyboardKeyWidget(text: "r", keyCode: 46, onPressed: keyPress),
              new KeyboardKeyWidget(text: "t", keyCode: 48, onPressed: keyPress),
              new KeyboardKeyWidget(text: "y", keyCode: 53, onPressed: keyPress),
              new KeyboardKeyWidget(text: "u", keyCode: 49, onPressed: keyPress),
              new KeyboardKeyWidget(text: "i", keyCode: 37, onPressed: keyPress),
              new KeyboardKeyWidget(text: "o", keyCode: 43, onPressed: keyPress),
              new KeyboardKeyWidget(text: "p", keyCode: 44, onPressed: keyPress),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "a", keyCode: 29, onPressed: keyPress),
              new KeyboardKeyWidget(text: "s", keyCode: 47, onPressed: keyPress),
              new KeyboardKeyWidget(text: "d", keyCode: 32, onPressed: keyPress),
              new KeyboardKeyWidget(text: "f", keyCode: 34, onPressed: keyPress),
              new KeyboardKeyWidget(text: "g", keyCode: 35, onPressed: keyPress),
              new KeyboardKeyWidget(text: "h", keyCode: 36, onPressed: keyPress),
              new KeyboardKeyWidget(text: "j", keyCode: 38, onPressed: keyPress),
              new KeyboardKeyWidget(text: "k", keyCode: 39, onPressed: keyPress),
              new KeyboardKeyWidget(text: "l", keyCode: 40, onPressed: keyPress),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "sh", keyCode: 59, onPressed: shiftPress, flex: 2),
              new KeyboardKeyWidget(text: "z", keyCode: 54, onPressed: keyPress),
              new KeyboardKeyWidget(text: "x", keyCode: 52, onPressed: keyPress),
              new KeyboardKeyWidget(text: "c", keyCode: 31, onPressed: keyPress),
              new KeyboardKeyWidget(text: "v", keyCode: 50, onPressed: keyPress),
              new KeyboardKeyWidget(text: "b", keyCode: 30, onPressed: keyPress),
              new KeyboardKeyWidget(text: "m", keyCode: 41, onPressed: keyPress),
              new KeyboardKeyWidget(text: "n", keyCode: 42, onPressed: keyPress),
              new KeyboardKeyWidget(text: "back", keyCode: 67, onPressed: keyPress, flex: 2),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "sym", keyCode: 63, onPressed: toggleSymbol),
              new KeyboardKeyWidget(text: "______________", keyCode: 62, onPressed: keyPress, flex: 5),
              new KeyboardKeyWidget(text: ",", keyCode: 55, onPressed: keyPress),
              new KeyboardKeyWidget(text: ".", keyCode: 56, onPressed: keyPress),
              new KeyboardKeyWidget(text: "ent", keyCode: 66, onPressed: keyPress, flex: 2),
            ],
          )
        ],
      ),
    );
  }

  Widget buildShift(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(2.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "1", keyCode: 8, onPressed: keyPress),
              new KeyboardKeyWidget(text: "2", keyCode: 9, onPressed: keyPress),
              new KeyboardKeyWidget(text: "3", keyCode: 10, onPressed: keyPress),
              new KeyboardKeyWidget(text: "4", keyCode: 11, onPressed: keyPress),
              new KeyboardKeyWidget(text: "5", keyCode: 12, onPressed: keyPress),
              new KeyboardKeyWidget(text: "6", keyCode: 13, onPressed: keyPress),
              new KeyboardKeyWidget(text: "7", keyCode: 14, onPressed: keyPress),
              new KeyboardKeyWidget(text: "8", keyCode: 15, onPressed: keyPress),
              new KeyboardKeyWidget(text: "9", keyCode: 16, onPressed: keyPress),
              new KeyboardKeyWidget(text: "0", keyCode: 7, onPressed: keyPress),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "Q", keyCode: 45, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "W", keyCode: 51, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "E", keyCode: 33, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "R", keyCode: 46, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "T", keyCode: 48, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "Y", keyCode: 53, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "U", keyCode: 49, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "I", keyCode: 37, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "O", keyCode: 43, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "P", keyCode: 44, onPressed: keyPress, shift: true),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "A", keyCode: 29, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "S", keyCode: 47, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "D", keyCode: 32, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "F", keyCode: 34, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "G", keyCode: 35, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "H", keyCode: 36, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "J", keyCode: 38, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "K", keyCode: 39, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "L", keyCode: 40, onPressed: keyPress, shift: true),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: (keyboardState == KeyboardState.CAPSLOCK ? "SH" : "Sh"), keyCode: 59, onPressed: shiftPress, flex: 2),
              new KeyboardKeyWidget(text: "Z", keyCode: 54, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "X", keyCode: 52, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "C", keyCode: 31, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "V", keyCode: 50, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "B", keyCode: 30, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "N", keyCode: 41, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "M", keyCode: 42, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "back", keyCode: 67, onPressed: keyPress, flex: 2),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "sym", keyCode: 63, onPressed: toggleSymbol),
              new KeyboardKeyWidget(text: "______________", keyCode: 62, onPressed: keyPress, flex: 5),
              new KeyboardKeyWidget(text: ",", keyCode: 55, onPressed: keyPress),
              new KeyboardKeyWidget(text: ".", keyCode: 56, onPressed: keyPress),
              new KeyboardKeyWidget(text: "ent", keyCode: 66, onPressed: keyPress, flex: 2),
            ],
          )
        ],
      ),
    );
  }

  Widget buildSymbol(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(2.0),
      child: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "1", keyCode: 8, onPressed: keyPress),
              new KeyboardKeyWidget(text: "2", keyCode: 9, onPressed: keyPress),
              new KeyboardKeyWidget(text: "3", keyCode: 10, onPressed: keyPress),
              new KeyboardKeyWidget(text: "4", keyCode: 11, onPressed: keyPress),
              new KeyboardKeyWidget(text: "5", keyCode: 12, onPressed: keyPress),
              new KeyboardKeyWidget(text: "6", keyCode: 13, onPressed: keyPress),
              new KeyboardKeyWidget(text: "7", keyCode: 14, onPressed: keyPress),
              new KeyboardKeyWidget(text: "8", keyCode: 15, onPressed: keyPress),
              new KeyboardKeyWidget(text: "9", keyCode: 16, onPressed: keyPress),
              new KeyboardKeyWidget(text: "0", keyCode: 7, onPressed: keyPress),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "!", keyCode: 8, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "@", keyCode: 9, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "#", keyCode: 10, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "\$", keyCode: 11, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "%", keyCode: 12, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "^", keyCode: 13, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "&", keyCode: 14, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "*", keyCode: 15, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "(", keyCode: 16, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: ")", keyCode: 7, onPressed: keyPress, shift: true),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "+", keyCode: 70, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "=", keyCode: 70, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "_", keyCode: 69, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "-", keyCode: 69, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "'", keyCode: 75, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "\"", keyCode: 75, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: ":", keyCode: 74, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: ";", keyCode: 74, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "?", keyCode: 76, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "/", keyCode: 76, onPressed: keyPress, shift: false)
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "`", keyCode: 68, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "~", keyCode: 68, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "\\", keyCode: 73, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "|", keyCode: 73, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "<", keyCode: 55, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: ">", keyCode: 56, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "{", keyCode: 71, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "}", keyCode: 72, onPressed: keyPress, shift: true),
              new KeyboardKeyWidget(text: "[", keyCode: 71, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "]", keyCode: 72, onPressed: keyPress, shift: false),
              new KeyboardKeyWidget(text: "back", keyCode: 67, onPressed: keyPress, flex: 2),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "abc", keyCode: 1, onPressed: toggleSymbol),
              new KeyboardKeyWidget(text: "______________", keyCode: 1, onPressed: keyPress, flex: 5),
              new KeyboardKeyWidget(text: ",", keyCode: 55, onPressed: keyPress),
              new KeyboardKeyWidget(text: ".", keyCode: 56, onPressed: keyPress),
              new KeyboardKeyWidget(text: "ent", keyCode: 66, onPressed: keyPress, flex: 2),
            ],
          )
        ],
      ),
    );
  }

  void keyPress(int keyCode, bool shift) {
    onPress(keyCode, shift);
    if (keyboardState == KeyboardState.SHIFT) {
      setState(() {
        keyboardState = KeyboardState.DEFAULT;
      });
    }
  }

  void shiftPress(int keyCode, bool shift) {
    onPress(keyCode, keyboardState == KeyboardState.SHIFT || keyboardState == KeyboardState.CAPSLOCK);
    if (keyboardState == KeyboardState.DEFAULT) {
      setState(() {
        keyboardState = KeyboardState.SHIFT;
      });
    } else if (keyboardState == KeyboardState.SHIFT) {
      setState(() {
        keyboardState = KeyboardState.CAPSLOCK;
      });
    } else if (keyboardState == KeyboardState.CAPSLOCK) {
      setState(() {
        keyboardState = KeyboardState.DEFAULT;
      });
    }
  }

  void toggleSymbol(int keyCode, bool shift) {
    if (keyboardState == KeyboardState.SYMBOLS) {
      setState(() {
        keyboardState = KeyboardState.DEFAULT;
      });
    } else {
      setState(() {
        symbolPage = 0;
        keyboardState = KeyboardState.SYMBOLS;
      });
    }
  }

  void nextSymbolPressed(int keyCode) {
    setState(() {
      if (symbolPage == 0) {
        symbolPage = 1;
      } else {
        symbolPage = 0;
      }
    });
  }
}

