import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class BricksBuild extends StatefulWidget {
  final AudioCache player = AudioCache();

  @override
  State<StatefulWidget> createState() {
    return _BricksBuildState();
  }

  Future play() async {
    return Future.wait([
      player.play('bell_ring.mp3'),
      player.play('cow.mp3')
    ]);
  }
}

class _BricksBuildState extends State<BricksBuild> {

  @override
  Widget build(BuildContext context) {
    _play(sound) async {
      widget.player.play(sound);
    }

    return new GridView.count(
      crossAxisCount: 4,
      children: new List<Widget>.generate(16, (index) {
        return new GridTile(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: FlatButton(
              color: Colors.red.shade300,
              child: new Text('$index'),
              onPressed: () async {
                await _play(index % 2 == 0 ? 'bell_ring.mp3' : 'cow.mp3');
              },
            ),
          ),
        );
      }),
    );
  }
}