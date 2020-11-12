import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key key}) : super(key: key);

  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    WordPair wordPair = WordPair.random();
    return Center(child: Text("${wordPair.asPascalCase}"));
  }
}
