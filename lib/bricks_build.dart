import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class BricksBuild extends StatelessWidget {

  AudioCache player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tijolos musicais"),
      ),
      body: new GridView.count(
        crossAxisCount: 4,
        children: new List<Widget>.generate(16, (index) {
          return new GridTile(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FlatButton(
                color: Colors.red.shade300,
                child: new Text('$index'),
                onPressed: () async {
                  String sound = index % 2 == 0
                      ? 'bell_ring.mp3'
                      : 'cow.mp3';
                  await player.play(sound);
                },
              )
            )
          );
        }),
      ),
    );
  }
}
