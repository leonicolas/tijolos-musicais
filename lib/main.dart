import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tijolos/bricks_build.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tijolos Musicais',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Meus tijolos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BricksBuild _bricksBuild = BricksBuild();
  final iconStop = Icon(Icons.stop);
  final iconPlay = Icon(Icons.play_arrow);
  Widget _icon;
  bool _playing;

  @override
  void initState() {
    super.initState();
    _icon = iconPlay;
    _playing = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _icon = iconPlay;
    _playing = false;
  }

  _playBricks() async {
    if(_playing) {
      print('It will stop!!!');
      _bricksBuild.stop();
      setState(() {
        _icon = iconPlay;
        _playing = false;
      });

    } else {
      print('It will play!!!');
      setState(() {
        _icon = iconStop;
        _playing = true;
      });
      _bricksBuild.play();
    }
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Tijolos musicais"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: _bricksBuild,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playBricks,
        tooltip: 'Tocar',
        child: _icon,
      )
    );
  }
}

