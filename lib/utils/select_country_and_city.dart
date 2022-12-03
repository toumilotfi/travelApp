import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class SingleNotifier extends ChangeNotifier {
  String _currentCountry = GetStorage().read('UserCountry');

  SingleNotifier();

  String get currentCountry => _currentCountry;

  updateCountry(String value) {
    if (value != _currentCountry) {
      _currentCountry = value;

      notifyListeners();
    }
  }
}
