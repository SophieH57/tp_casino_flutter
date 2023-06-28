import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  final List<String> items = [
    'images/bar.png',
    'images/cerise.png',
    'images/cloche.png',
    'images/diamant.png',
    'images/fer-a-cheval.png',
    'images/pasteque.png',
    'images/sept.png'
  ];

  // int _item1 = 1;
  // int _item2 = 1;
  // int _item3 = 1;
  int _item1 = Random().nextInt(6);
  int _item2 = Random().nextInt(6);
  int _item3 = Random().nextInt(6);

  void _play() {
    setState(() {
      _item1 = Random().nextInt(6);
      _item2 = Random().nextInt(6);
      _item3 = Random().nextInt(6);
    });
  }

  bool _isWinner() {
    bool winner =
        (_item1.compareTo(_item2) == 0 && _item2.compareTo(_item3) == 0)
            ? true
            : false;
    return winner;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Casino'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                items[_item1],
                width: 100,
                height: 100,
              ),
              Image.asset(
                items[_item2],
                width: 100,
                height: 100,
              ),
              Image.asset(
                items[_item3],
                width: 100,
                height: 100,
              ),
            ],
          ),
          Text(
            _isWinner() ? 'Jackpot ! You win !' : 'You loose... Try again !',
            style: TextStyle(
              fontWeight: _isWinner() ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _play(),
        tooltip: 'Play',
        hoverColor: Colors.purple,
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
