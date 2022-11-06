import 'package:flutter/material.dart';

///
/// This package makes it easier to manage the state of textfields.
///
/// Author Masahide Mori
///
/// First edition creation date 2022-11-05 23:49:27
///
class TextFieldManager {
  Map<String, TextEditingController> ctrlMap = {};
  Map<String, FocusNode> focusMap = {};

  /// Constructor
  TextFieldManager();

  /// (en)Dispose all managed objects.
  /// Usually called inside the dispose of the widget.
  ///
  /// (ja)管理中の全てのオブジェクトを破棄します。
  /// 通常、ウィジェットのdispose内で呼び出します。
  void dispose() {
    for (TextEditingController i in ctrlMap.values) {
      i.dispose();
    }
    for (FocusNode i in focusMap.values) {
      i.dispose();
    }
    ctrlMap.clear();
    focusMap.clear();
  }

  /// (en)If the controller with the specified name has been created,
  /// return it, otherwise return newly created one.
  ///
  /// (ja)指定名のコントローラが生成済みならばそれを、無ければ生成して返します。
  ///
  /// * [name] : A unique name assigned to the TextEditingController.
  /// * [initialText] : Initial text for the controller.
  /// Applies only when first created.
  TextEditingController getCtrl(String name, {String? initialText}) {
    if (ctrlMap.containsKey(name)) {
      return ctrlMap[name]!;
    } else {
      TextEditingController r = TextEditingController(text: initialText);
      ctrlMap[name] = r;
      return r;
    }
  }

  /// (en)If the FocusNode with the specified name has been created,
  /// return it, otherwise return newly created one.
  ///
  /// (ja)指定名のフォーカスノードが生成済みならばそれを、無ければ生成して返します。
  ///
  /// * [name] : A unique name assigned to the FocusNode.
  FocusNode getFocus(String name) {
    if (focusMap.containsKey(name)) {
      return focusMap[name]!;
    } else {
      FocusNode r = FocusNode();
      focusMap[name] = r;
      return r;
    }
  }

  /// (en)Returns a map of managed controllers.
  /// Do not normally call this directly.
  ///
  /// (ja)管理中のコントローラのマップを返します。
  /// 通常はこれを直接呼び出さないでください。
  Map<String, TextEditingController> getAllCtrl() {
    return ctrlMap;
  }

  /// (en)Returns a map of managed FocusNodes.
  /// Do not normally call this directly.
  ///
  /// (ja)管理中のフォーカスノードのマップを返します。
  /// 通常はこれを直接呼び出さないでください。
  Map<String, FocusNode> getALLFocus() {
    return focusMap;
  }
}
