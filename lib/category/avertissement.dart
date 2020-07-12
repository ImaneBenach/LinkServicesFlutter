import 'package:flutter/material.dart';

class Avertissement extends StatefulWidget {
  Avertissement({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AvertissementState createState() => _AvertissementState();
}

class _AvertissementState extends State<Avertissement> {
  int _counter = 0;

  void _incrementCounter() {
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
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: 5,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            child: Text('$index'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Sender $index'),
                Text('Subject $index'),
                Text('Snippet $index'),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: OutlineButton(
                        onPressed: () => print('pressed'),
                        child: Text('Attachment 1'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),
                    OutlineButton(
                      onPressed: () => print('pressed'),
                      child: Text('Attachment 1'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}