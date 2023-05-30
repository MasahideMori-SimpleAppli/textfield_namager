import 'package:test/test.dart';
import 'package:textfield_manager/textfield_manager.dart';

void main() {
  group('serialize test', () {
    test('toDict and fromDict test', () {
      final TextFieldManager tfm = TextFieldManager();
      tfm.getCtrl("first", initialText: "1", isAlwaysInitialize: true);
      tfm.getCtrl("second", initialText: "2", isAlwaysInitialize: true);
      Map<String, dynamic> map = tfm.toDict(nonSaveKeys: ["second"]);
      tfm.getCtrl("first").text = "first";
      tfm.fromDict(map);
      expect(tfm.getCtrl("first").text == "1", true);
      expect((map["text_map"] as Map).containsKey("first"), true);
      expect(!(map["text_map"] as Map).containsKey("second"), true);
      // function check
      tfm.getCtrl("first", initialText: "", isAlwaysInitialize: true);
      expect(tfm.containsEmptyCtrl(), true);
      tfm.getCtrl("first", initialText: "1", isAlwaysInitialize: true);
      expect(tfm.containsEmptyCtrl(), false);
    });
  });
}
