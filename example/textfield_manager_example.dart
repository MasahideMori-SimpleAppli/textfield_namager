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
  TextFieldManager manager = TextFieldManager();

  @override
  void dispose() {
    manager.dispose();
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
                  focusNode: manager.getFocus("first"),
                  controller: manager.getCtrl("first", initialText: "first"),
                  onSubmitted: (String s) {
                    manager.getFocus("second").requestFocus();
                  },
                ),
                TextField(
                  focusNode: manager.getFocus("second"),
                  controller: manager.getCtrl("second", initialText: "second"),
                  onSubmitted: (String s) {
                    manager.getFocus("third").requestFocus();
                  },
                ),
                TextField(
                  focusNode: manager.getFocus("third"),
                  controller: manager.getCtrl("third", initialText: "third"),
                  onSubmitted: (String s) {
                    manager.getFocus("first").requestFocus();
                  },
                )
              ],
            )),
      ),
    );
  }
}
