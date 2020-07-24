import 'package:flutter/material.dart';

class BricksBuild extends StatelessWidget {
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
            child: new Card(
              color: Colors.red.shade200,
              child: new Center(
                child: new Text('$index'),
              ),
            )
          );
        }),
      ),
    );
  }
}