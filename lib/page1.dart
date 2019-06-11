import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:radio_test/models/Player.dart';

class PageOne extends StatefulWidget {
  final Color color;
  final String title;

  PageOne({Key key, MaterialColor this.color, String this.title}) : super(key: key);

  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {


  @override
  Widget build(BuildContext context) {

    final _player = ScopedModel.of<Player>(context, rebuildOnChange: true);
    
    return Container(
      color: widget.color == null ? Colors.lightBlue : widget.color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('${widget.title} (${_player.playerStatus})'),),
        ],
      ),
    );
  }
}