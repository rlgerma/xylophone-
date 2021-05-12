import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneMain());
}

class XylophoneMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Xylophone App'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void playNote(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  static const colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: (SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: ListView.builder(
              itemCount: colors.length,
              itemBuilder: (context, int i) {
                return Padding(
                  padding: const EdgeInsets.all(21.0),
                  child: ElevatedButton(
                    onPressed: () => playNote(i + 1),
                    style: ElevatedButton.styleFrom(
                      primary: colors[i],
                    ),
                    child: null,
                  ),
                );
              },
            ),
          ),
        ),
      ))),
    );
  }
}
