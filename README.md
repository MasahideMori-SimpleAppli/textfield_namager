# textfield_manager

## Overview
This package makes it easier to manage the state of textfields.

## Usage
Please see Example tab for usage.  
You can collectively dispose in dispose method all TextEditingControllers and FocusNodes inside a StatefulWidget.

```dart
TextFieldManager manager = TextFieldManager();

@override
void dispose() {
  manager.dispose();
  super.dispose();
}
```

Call getCtrl or getFocus method widh name will internally create a new object if not yet created, or return the previously created one if already created.

```dart
TextField(
  focusNode: manager.getFocus("first"),
  controller: manager.getCtrl("first", initialText: "first"),
  onSubmitted: (String s) {
    manager.getFocus("second").requestFocus();
  }
)
```

## Support
Basically no support.
Please file an issue if you have any problems.
This package is low priority, but may be fixed.

## About version control
The C part will be changed at the time of version upgrade.
- Changes such as adding variables, structure change that cause problems when reading previous files.
  - C.X.X
- Adding methods, etc.
  - X.C.X
- Minor changes and bug fixes.
  - X.X.C

If the version is less than 1, there may be major corrections and changes regardless of the above.

## License
This software is released under the MIT License, see LICENSE file.

## Copyright notice
The "Dart" name and "Flutter" name are trademarks of Google LLC.  
*The developer of this package is not Google LLC.