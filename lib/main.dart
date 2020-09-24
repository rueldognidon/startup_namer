// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  //final _biggerFont = TextStyle(fontSize: 18.0);
  Color _bgColor = Colors.white;

  void _setColor() {
    setState(() {
      if (_bgColor == Colors.white) {
        _bgColor = Colors.red;
      } else {
        _bgColor = Colors.white;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Startup Name Generator")),
      body: _buildSuggestions(_bgColor),
      floatingActionButton: FloatingActionButton(
        onPressed: _setColor,
        child: Icon(
          Icons.brush,
        ),
      ),
    );
  }

  Widget _buildSuggestions(Color bgColor) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _buildRow(_suggestions[index], bgColor);
        });
  }

  Widget _buildRow(WordPair suggestion, Color bgColor) {
    return ListTile(
      title: Text(
        suggestion.asPascalCase,
        style: TextStyle(
          fontSize: 16.0,
          backgroundColor: bgColor,
        ),
      ),
    );
  }
}
