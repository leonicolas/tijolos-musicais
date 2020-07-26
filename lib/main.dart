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

  _playBricks() {
    _bricksBuild.play();
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
          child: Icon(Icons.play_arrow),
        )
    );
  }
}

class _MyHomePageState2 extends State<MyHomePage> {
  int _counter = 0;

  void _playBricks() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playBricks,
        tooltip: 'Tocar',
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
