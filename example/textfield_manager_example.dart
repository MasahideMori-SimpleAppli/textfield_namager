import 'package:flutter/material.dart';
import 'package:textfield_manager/textfield_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextFieldManager _tfm = TextFieldManager();

  @override
  void dispose() {
    _tfm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  focusNode: _tfm.getFocus("first"),
                  controller: _tfm.getCtrl("first", initialText: "first"),
                  onSubmitted: (String s) {
                    _tfm.getFocus("second").requestFocus();
                  },
                ),
                TextField(
                  focusNode: _tfm.getFocus("second"),
                  controller: _tfm.getCtrl("second", initialText: "second"),
                  onSubmitted: (String s) {
                    _tfm.getFocus("third").requestFocus();
                  },
                ),
                TextField(
                  focusNode: _tfm.getFocus("third"),
                  controller: _tfm.getCtrl("third", initialText: "third"),
                  onSubmitted: (String s) {
                    _tfm.getFocus("first").requestFocus();
                  },
                )
              ],
            )),
      ),
    );
  }
}
