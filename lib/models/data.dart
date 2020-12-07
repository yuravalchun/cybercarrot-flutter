import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Data with ChangeNotifier {
  final String key = "count";
  String _count;
  SharedPreferences _pref;

  Data() {
    this._count = '10';
    _loadFromPrefs();
  }

  String get getCount => _count;

  void changeCount(newCount) {
    _count = (int.parse(_count) + newCount).toString();
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(_pref == null)
      _pref  = await SharedPreferences.getInstance();
  }
  _loadFromPrefs() async {
    await _initPrefs();
    _count = _pref.getString(key) ?? '10';
    notifyListeners();
  }
  _saveToPrefs() async {
    await _initPrefs();
    _pref.setString(key, _count);
  }
}