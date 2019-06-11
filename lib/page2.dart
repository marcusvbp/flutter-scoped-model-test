import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:radio_test/models/Player.dart';
import 'package:radio_test/models/User.dart';

class PageTwo extends StatefulWidget {
  final Color color;
  final String title;

  PageTwo({Key key, MaterialColor this.color, String this.title}) : super(key: key);

  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {


  @override
  Widget build(BuildContext context) {

    final _player = ScopedModel.of<Player>(context, rebuildOnChange: true);
    final _user = ScopedModel.of<User>(context, rebuildOnChange: true);
    
    return Container(
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
    );
  }
}