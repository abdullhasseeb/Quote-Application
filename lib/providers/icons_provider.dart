import 'package:flutter/cupertino.dart';
import 'package:quoteapp/providers/favourite_items.dart';

class IconsProvider with ChangeNotifier{
  double _favIcon = 55.0;
  double _themeIcon = 55.0;
  double _userIcon = 55.0;
  double _settingsIcon =  55.0;

  double get getFavIconSize => _favIcon;
  double get getThemeIconSize => _themeIcon;
  double get getUserIconSize => _userIcon;
  double get getSettingsIconSize => _settingsIcon;

  setFavIconSize(double size){
    _favIcon = size;
    notifyListeners();
  }
  setThemeIconSize(double size){
    _themeIcon = size;
    notifyListeners();
  }
  setUserIconSize(double size){
    _userIcon = size;
    notifyListeners();
  }
  setSettingsIconSize(double size){
    _settingsIcon = size;
    notifyListeners();
  }
}