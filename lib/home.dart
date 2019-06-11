import 'package:flutter/material.dart';
import 'package:radio_test/page1.dart';
import 'package:radio_test/page2.dart';
import 'package:radio_test/MyPlayer.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:radio_test/models/Player.dart';
import 'package:radio_test/models/User.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  IconData _fabIcon = Icons.radio;
  User _u = User();

  TextEditingController _changeNameCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _changeNameCtrl.text = _u.name;
    });
  }


  @override
  Widget build(BuildContext context) {

    final _player = ScopedModel.of<Player>(context, rebuildOnChange: true);
    final _user = ScopedModel.of<User>(context, rebuildOnChange: true);
    // _changeNameCtrl.text = _user.name;
    
    void _getPlayerIcon({PlayerStatus status}) {
      setState(() {  
        switch (status) {
          case PlayerStatus.playing:
            _fabIcon = Icons.stop;
            break;
          case PlayerStatus.not_played:
          case PlayerStatus.stopped:
            _fabIcon = Icons.play_arrow;
            break;
        }
      });
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            PageOne(title: 'Pagina 1', color: Colors.lightBlue),
            PageTwo(title: 'Pagina 2', color: Colors.lightGreen),
            PageOne(title: 'Pagina 3', color: Colors.teal)
          ],
        ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TabBar(
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                text: 'Pagina 1',
              ),
              Tab(
                text: 'Pagina 2',
              ),
              Tab(
                text: 'Pagina 3',
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _changeNameCtrl,
              decoration: InputDecoration(labelText: 'Change user name'),
              onChanged: (v) {
                _user.changeName(v);
              },
            ),
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
              return MyPlayer(model: _player, callback: _getPlayerIcon,);
            });
          },
          backgroundColor: Colors.red,
          child: Icon(_fabIcon),
        ),
      ),
    );
  }

}