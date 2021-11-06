import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final player = AudioCache();
    List<Expanded> renderButtons(List<Color> colors) {
      return colors
          .asMap()
          .entries
          .map((entry) => Expanded(
            child: TextButton(
                  onPressed: () {
                    player.play('note${entry.key + 1}.wav');
                  },
                  style: TextButton.styleFrom(backgroundColor: entry.value),
                  child: null,
                ),
          ))
          .toList();
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: renderButtons([
              Colors.red,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.teal,
              Colors.blue,
              Colors.purple
            ]),
          ),
        ),
      ),
    );
  }
}
