import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  String _name = 'Marcus Vinícius';

  String get name => _name;

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }
}