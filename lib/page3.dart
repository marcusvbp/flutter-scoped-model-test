import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:radio_test/models/Player.dart';
import 'package:radio_test/models/User.dart';

class PageThree extends StatefulWidget {
  final Color color;
  final String title;

  PageThree({Key key, this.color, this.title}) : super(key: key);

  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {


  @override
  Widget build(BuildContext context) {

    final _player = ScopedModel.of<Player>(context, rebuildOnChange: true);
    final _user = ScopedModel.of<User>(context, rebuildOnChange: true);
    
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.star),
      ),
      body: Container(
        color: widget.color == null ? Colors.lightBlue : widget.color,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${widget.title} (${_player.playerStatus})'),
              Text('${_user.name}')
            ],
          )
        ),
      ),
    );
  }
}