import 'package:scoped_model/scoped_model.dart';

enum PlayerStatus {
  not_played,
  playing,
  stopped
}

class Player extends Model {
  PlayerStatus _status = PlayerStatus.not_played;

  PlayerStatus get playerStatus => _status;

  void changeStatus () {
    switch (_status) {
      case PlayerStatus.not_played:
      case PlayerStatus.stopped:
        _status = PlayerStatus.playing;
        break;
      case PlayerStatus.playing:
        _status = PlayerStatus.stopped;
    }
    notifyListeners();
  }
}