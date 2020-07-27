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
  int _column = 0;

  @override
  initState() {
    super.initState();
    widget.player.loadAll(_soundList);
  }

  Future<bool> play() {
    setState(() {
      _column = -1;
      _playing = true;
    });

    return Future.doWhile(() async {
      setState(() {
        _column++;
      });
      _play(_column);
      await Future.delayed(const Duration(milliseconds: 500));
      return _playing;
    });
  }

  stop() {
    setState(() {
      _playing = false;
    });
  }

  Future _play(int index) async {
    return widget.player.play(
      _soundList[index % 4],
      stayAwake: true
    );
  }

  Color _getColor(int index) {
    return _playing && index % 4 == _column % 4
      ? Colors.yellow.shade300
      : Colors.red.shade300;
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
              color: _getColor(index),
              child: new Text('$index'),
              onPressed: () => _play(index),
            ),
          ),
        );
      }),
    );
  }
}