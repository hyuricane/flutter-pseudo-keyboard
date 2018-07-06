library pseudo_keyboard;

import 'package:flutter/material.dart';

enum KeyboardState { DEFAULT, SHIFT, CAPSLOCK, SYMBOLS }


const keyboardKeypadding = const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0);

class KeyboardKeyWidget extends StatelessWidget {
  final int keyCode;
  final bool shift;
  final String text;
  final Icon icon;
  final int flex;
  final void Function(int keyCode, bool shift) onKeyUp;
  final void Function(int keyCode, bool shift) onKeyDown;


  final IconThemeData iconTheme = new IconThemeData();

  KeyboardKeyWidget({@required this.keyCode, this.text, this.icon, @required this.onKeyUp, @required this.onKeyDown, this.flex = 1, this.shift = false});

  
  @override
  Widget build(BuildContext context) {
    ButtonThemeData buttonTheme = ButtonTheme.of(context);
    return new Expanded(
        flex: flex,
        child: Container(
            margin: EdgeInsets.all(1.0),
            child: Semantics(
              container: true,
              button: true,
              enabled: true,
              child: ConstrainedBox(
                constraints: buttonTheme.constraints,
                child: Material(
                  shape: buttonTheme.shape,
                  elevation: 2.0,
                  color: Color.fromARGB(255, 238, 238, 238),
                  type: MaterialType.button,
                  animationDuration: kThemeChangeDuration,
                  child: InkWell(
                    onTap: () => this.onPressedUp(),
                    onTapDown: (detail) => this.onPressedDown(),
                    onLongPress: () => this.onLongPress(),
                    child: IconTheme.merge(
                        data: iconTheme,
                        child: Container(
                          padding: keyboardKeypadding,
                          child: Center(
                            widthFactor: 1.0,
                            heightFactor: 1.0,
                            child: icon == null ? Text(text) : icon,
                          ),
                        )),
                  ),
                ),
              ),
            )));

    // if (icon != null) {
    //   return new Expanded(
    //     flex: flex,
    //     child: new Container(
    //       margin: EdgeInsets.all(1.0),
    //       child: new IconButton(
    //         color: Color.fromARGB(255, 238, 238, 238),
    //         icon: icon,
    //         padding: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
    //         onPressed: () => this.onKeyUp(keyCode, shift),
    //       ),
    //     ),
    //   );
    // } else {
    //   RawMaterialButton();
    //   return new Expanded(
    //     child: new Container(
    //       child: new MaterialButton(
    //         color: Color.fromARGB(255, 238, 238, 238),
    //         child: new Text(text),
    //         padding: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
    //         onPressed: () => this.onPressed(keyCode, shift),
    //       ),
    //       margin: EdgeInsets.all(1.0),
    //     ),
    //     flex: flex,
    //   );
    // }
  }

  var isLongPress = false;

  void onPressedDown() {
    this.onKeyDown(keyCode, shift);
  }

  void onPressedUp() {
    if (!isLongPress) {
      this.onKeyUp(keyCode, shift);
    }
  }

  void onLongPress() {
    isLongPress = true;
  }
}

class KeyboardWidget extends StatefulWidget {
  final KeyboardState keyboardState;
  final Function(int keyCode, bool isShift) onPress;
  final Function(int keyCode, bool isShift) onPressDown;

  KeyboardWidget({this.keyboardState = KeyboardState.DEFAULT, this.onPress, this.onPressDown});

  @override
  State<StatefulWidget> createState() {
    return new _KeyboardState(keyboardState: this.keyboardState);
  }
}

class _KeyboardState extends State<KeyboardWidget> {
  KeyboardState keyboardState;
  int symbolPage = 0;
  // final Function(int keyCode, bool isShift) onPress;
  // final Function(int keyCode, bool isShift) onPressDown;

  _KeyboardState({this.keyboardState});

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
              new KeyboardKeyWidget(text: "1", keyCode: 8, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "2", keyCode: 9, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "3", keyCode: 10, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "4", keyCode: 11, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "5", keyCode: 12, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "6", keyCode: 13, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "7", keyCode: 14, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "8", keyCode: 15, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "9", keyCode: 16, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "0", keyCode: 7, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "q", keyCode: 45, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "w", keyCode: 51, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "e", keyCode: 33, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "r", keyCode: 46, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "t", keyCode: 48, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "y", keyCode: 53, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "u", keyCode: 49, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "i", keyCode: 37, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "o", keyCode: 43, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "p", keyCode: 44, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "a", keyCode: 29, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "s", keyCode: 47, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "d", keyCode: 32, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "f", keyCode: 34, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "g", keyCode: 35, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "h", keyCode: 36, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "j", keyCode: 38, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "k", keyCode: 39, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "l", keyCode: 40, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "sh", keyCode: 59, onKeyUp: shiftPress, onKeyDown: (_, ignored) {}, flex: 2),
              new KeyboardKeyWidget(text: "z", keyCode: 54, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "x", keyCode: 52, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "c", keyCode: 31, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "v", keyCode: 50, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "b", keyCode: 30, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "m", keyCode: 41, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "n", keyCode: 42, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "back", keyCode: 67, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 2),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "sym", keyCode: 63, onKeyUp: toggleSymbol, onKeyDown: (_, ignored) {}),
              new KeyboardKeyWidget(text: "______________", keyCode: 62, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 5),
              new KeyboardKeyWidget(text: ",", keyCode: 55, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: ".", keyCode: 56, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "ent", keyCode: 66, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 2),
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
              new KeyboardKeyWidget(text: "1", keyCode: 8, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "2", keyCode: 9, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "3", keyCode: 10, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "4", keyCode: 11, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "5", keyCode: 12, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "6", keyCode: 13, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "7", keyCode: 14, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "8", keyCode: 15, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "9", keyCode: 16, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "0", keyCode: 7, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "Q", keyCode: 45, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "W", keyCode: 51, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "E", keyCode: 33, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "R", keyCode: 46, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "T", keyCode: 48, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "Y", keyCode: 53, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "U", keyCode: 49, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "I", keyCode: 37, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "O", keyCode: 43, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "P", keyCode: 44, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "A", keyCode: 29, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "S", keyCode: 47, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "D", keyCode: 32, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "F", keyCode: 34, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "G", keyCode: 35, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "H", keyCode: 36, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "J", keyCode: 38, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "K", keyCode: 39, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "L", keyCode: 40, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(
                  text: (keyboardState == KeyboardState.CAPSLOCK ? "SH" : "Sh"), keyCode: 59, onKeyUp: shiftPress, onKeyDown: (_, ignored) {}, flex: 2),
              new KeyboardKeyWidget(text: "Z", keyCode: 54, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "X", keyCode: 52, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "C", keyCode: 31, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "V", keyCode: 50, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "B", keyCode: 30, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "N", keyCode: 41, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "M", keyCode: 42, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "back", keyCode: 67, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 2),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "sym", keyCode: 63, onKeyUp: toggleSymbol, onKeyDown: (_, ignored) {}),
              new KeyboardKeyWidget(text: "______________", keyCode: 62, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 5),
              new KeyboardKeyWidget(text: ",", keyCode: 55, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: ".", keyCode: 56, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "ent", keyCode: 66, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 2),
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
              new KeyboardKeyWidget(text: "1", keyCode: 8, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "2", keyCode: 9, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "3", keyCode: 10, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "4", keyCode: 11, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "5", keyCode: 12, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "6", keyCode: 13, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "7", keyCode: 14, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "8", keyCode: 15, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "9", keyCode: 16, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "0", keyCode: 7, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "!", keyCode: 8, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "@", keyCode: 9, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "#", keyCode: 10, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "\$", keyCode: 11, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "%", keyCode: 12, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "^", keyCode: 13, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "&", keyCode: 14, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "*", keyCode: 15, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "(", keyCode: 16, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: ")", keyCode: 7, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "+", keyCode: 70, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "=", keyCode: 70, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "_", keyCode: 69, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "-", keyCode: 69, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "'", keyCode: 75, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "\"", keyCode: 75, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: ":", keyCode: 74, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: ";", keyCode: 74, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "?", keyCode: 76, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "/", keyCode: 76, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false)
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "`", keyCode: 68, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "~", keyCode: 68, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "\\", keyCode: 73, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "|", keyCode: 73, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "<", keyCode: 55, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: ">", keyCode: 56, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "{", keyCode: 71, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "}", keyCode: 72, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: true),
              new KeyboardKeyWidget(text: "[", keyCode: 71, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "]", keyCode: 72, onKeyUp: keyPress, onKeyDown: onKeyPressDown, shift: false),
              new KeyboardKeyWidget(text: "back", keyCode: 67, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 2),
            ],
          ),
          new Row(
            children: <Widget>[
              new KeyboardKeyWidget(text: "abc", keyCode: 1, onKeyUp: toggleSymbol, onKeyDown: (_, ignored) {}),
              new KeyboardKeyWidget(text: "______________", keyCode: 1, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 5),
              new KeyboardKeyWidget(text: ",", keyCode: 55, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: ".", keyCode: 56, onKeyUp: keyPress, onKeyDown: onKeyPressDown),
              new KeyboardKeyWidget(text: "ent", keyCode: 66, onKeyUp: keyPress, onKeyDown: onKeyPressDown, flex: 2),
            ],
          )
        ],
      ),
    );
  }

  void onKeyPressDown(int keyCode, bool shift) {
    if (widget.onPressDown != null) widget.onPressDown(keyCode, shift);
    if (keyboardState == KeyboardState.SHIFT) {
      setState(() {
        keyboardState = KeyboardState.DEFAULT;
      });
    }
  }

  void keyPress(int keyCode, bool shift) {
    if (widget.onPress != null) widget.onPress(keyCode, shift);
    if (keyboardState == KeyboardState.SHIFT) {
      setState(() {
        keyboardState = KeyboardState.DEFAULT;
      });
    }
  }

  void shiftPress(int keyCode, bool shift) {
    if (widget.onPress != null) widget.onPress(keyCode, keyboardState == KeyboardState.SHIFT || keyboardState == KeyboardState.CAPSLOCK);
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
