# textfield_manager

## Note
This package has been merged into the [simple_managers](https://pub.dev/packages/simple_managers) package.  
This package is now deprecated.

## Overview
This package makes it easier to manage the state of textfields.

## Usage
Please see Example tab for usage.  
You can collectively dispose in dispose method all TextEditingControllers and FocusNodes inside a StatefulWidget.

```dart
TextFieldManager _tfm = TextFieldManager();

@override
void dispose() {
  _tfm.dispose();
  super.dispose();
}
```

Call getCtrl or getFocus method with name will internally create a new object if not yet created, or return the previously created one if already created.

```dart
TextField(
  focusNode: _tfm.getFocus("first"),
  controller: _tfm.getCtrl("first", initialText: "first"),
  onSubmitted: (String s) {
    _tfm.getFocus("second").requestFocus();
  }
)
```

## Serialization
A call to toDict can generate a Map containing information about all the text fields being assigned.
Additionally, you can retrieve information from this Map using fromDict.

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