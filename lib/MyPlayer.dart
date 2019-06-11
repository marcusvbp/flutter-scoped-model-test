import 'package:flutter/material.dart';
import 'package:radio_test/models/Player.dart';


class MyPlayer extends StatefulWidget {

  final Player model;
  final Function callback;

  MyPlayer({Key key, this.model, this.callback}) : super(key: key);

  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('Status: ${widget.model.playerStatus}'),
          ),
          FlatButton(
            onPressed: () {
              widget.model.changeStatus();
              widget.callback(status: widget.model.playerStatus);
              setState(() {});
            },
            child: Icon(
              widget.model.playerStatus == PlayerStatus.not_played || widget.model.playerStatus == PlayerStatus.stopped
                ? Icons.play_arrow
                : Icons.stop
            )
          )
        ],
      ),
    );
  }
}