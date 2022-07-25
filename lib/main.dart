import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'image_banner.dart';
import 'text_section.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final suggestions = <WordPair>[];
  final biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        centerTitle: true,
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              ImageBanner("assets/images/windows_xp.jpg"),
            ],
          ),
          titleSpacing: 0,
          toolbarHeight: 150,
        ),
        body: Scaffold(
          appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                TextSection(Colors.red),
                TextSection(Colors.yellow),
                TextSection(Colors.green),
                TextSection(Colors.blue),
              ],
            ),
            titleSpacing: 0,
            toolbarHeight: 108,
          ),
          body: buildSuggestions(),
        ),
      ),
    );
  }

  Widget buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) {
          return const Divider();
        }

        final int index = i ~/ 2;

        if (index >= suggestions.length) {
          suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: biggerFont,
      ),
    );
  }
}
