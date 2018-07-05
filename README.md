# pseudo_keyboard

Widget to simulate keyboard UI in flutter

<strong>not a real keyboard</strong>

## Getting Started

to include in flutter yaml

```
  pseudo_keyboard:
    git: git://github.com/hyuricane/flutter-pseudo-keyboard.git
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
            new KeyboardWidget(onPress: (int keyCode, bool isShift) {
              debugPrint("keyPress {code: $keyCode, shift: $isShift}");
            })
          ],
        ),
      ),
    );
  }

```
