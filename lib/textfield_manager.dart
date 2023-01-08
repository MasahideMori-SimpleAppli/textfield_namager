import 'package:flutter/material.dart';

///
/// This package makes it easier to manage the state of textfields.
///
/// Author Masahide Mori
///
/// First edition creation date 2022-11-05 23:49:27
///
class TextFieldManager {
  String get className => 'TextFieldManager';
  String get version => '2';
  Map<String, TextEditingController> ctrlMap = {};
  Map<String, FocusNode> focusMap = {};

  /// Constructor
  TextFieldManager();

  /// (en)Convert the object to a dictionary.
  /// Be careful how you handle user data.
  ///
  /// (ja)このクラスを辞書に変換します。
  /// 簡単に変換できますが、変換されたユーザーデータの取り扱いには十分注意することをお勧めします。
  ///
  /// * [nonSaveKeys] : If you specify a key that you don't want saved,
  /// that key and its contents will not be converted to a dictionary.
  Map<String, dynamic> toDict({List<String>? nonSaveKeys}) {
    Map<String, dynamic> d = {};
    d['class_name'] = className;
    d['version'] = version;
    Map<String, String> textMap = {};
    for (String i in ctrlMap.keys) {
      if (nonSaveKeys != null) {
        if (!nonSaveKeys.contains(i)) {
          textMap[i] = ctrlMap[i]!.text;
        }
      } else {
        textMap[i] = ctrlMap[i]!.text;
      }
    }
    d['text_map'] = textMap;
    return d;
  }

  /// (en)Restore this object from the dictionary.
  /// If data with the same key already exists, it will be overwritten.
  ///
  /// (ja)このクラスのtoDictで変換された辞書から、このクラスに設定されていた内容を復元します。
  /// * [src] : A dictionary made with toDict of this class.
  void fromDict(Map<String, dynamic> src) {
    for (var i in src['text_map'].keys) {
      getCtrl(i as String,
          initialText: src['text_map'][i] as String, isAlwaysInitialize: true);
      getFocus(i);
    }
  }

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
  /// * [isAlwaysInitialize] : If true, always set initialText.
  /// If true and initialText is null, initialize by empty string.
  TextEditingController getCtrl(String name,
      {String? initialText, bool isAlwaysInitialize = false}) {
    if (ctrlMap.containsKey(name)) {
      if (isAlwaysInitialize) {
        ctrlMap[name]!.text = initialText ?? "";
      }
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
