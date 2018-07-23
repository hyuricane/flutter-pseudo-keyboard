# pseudo_keyboard

Widget to simulate keyboard UI in flutter

<strong>not a real keyboard</strong>

## Getting Started

to include in flutter yaml

```
  dependencies:
    pseudo_keyboard: ^1.0.0
```

sample in code: 

```
import 'package:pseudo_keyboard/pseudo_keyboard.dart';

...

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      body: new SafeArea(
        child: new Column(
          children: <Widget>[
            new Expanded(
              flex: 2,
              child: new Center(
                child: new Text("Main Body")
              )
            ),
            new KeyboardWidget(
              onKeyUp: (int keyCode, bool isShift, bool canceled) {
                debugPrint("keyPressUp {code: $keyCode, shift: $isShift, canceled: $canceled}");
              }, 
              onKeyDown: (int keyCode, bool isShift) {
                debugPrint("keyPressDown {code: $keyCode, shift: $isShift}");
              },
            ),
          ],
        ),
      ),
    );
  }

```
