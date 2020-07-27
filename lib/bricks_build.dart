import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

class BricksBuild extends StatefulWidget {
  final AudioCache player = AudioCache();
  final BricksBuildState state = new BricksBuildState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  Future play() async {
    return state.play();
  }

  Future stop() async {
    return state.stop();
  }
}

class BricksBuildState extends State<BricksBuild> {

  final List<String> _soundList = [
    'bass_drum.mp3',
    'hi_hat_closed.mp3',
    'medium_tom.mp3',
    'small_tom.mp3',
  ];

  bool _playing = false;

  @override
  initState() {
    super.initState();
    widget.player.loadAll(_soundList);
  }

  Future<bool> play() {
    setState(() {
      _playing = true;
    });

    int count = 0;
    return Future.doWhile(() async {
      _play(count++);
      await Future.delayed(const Duration(milliseconds: 500));
      return _playing;
    });
  }

  stop() {
    setState(() {
      _playing = false;
    });
  }

  Future _play(index) async {
    return widget.player.play(
      _soundList[index % 4],
      stayAwake: true
    );
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      crossAxisCount: 4,
      children: new List<Widget>.generate(16, (index) {
        return new GridTile(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: FlatButton(
              color: Colors.red.shade300,
              child: new Text('$index'),
              onPressed: () => _play(index),
            ),
          ),
        );
      }),
    );
  }
}