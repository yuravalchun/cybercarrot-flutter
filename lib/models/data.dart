import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  String _count = '10';

  String get getCount => _count;

  void changeCount(newCount) {
    _count = (int.parse(_count) + newCount).toString();

    notifyListeners();
  }
}