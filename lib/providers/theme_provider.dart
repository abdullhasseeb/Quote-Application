import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_color/random_color.dart';

class ThemeProvider with ChangeNotifier{

  bool _check = false;
  int _currentTheme = 1;
  List<Color> _quoteBackgroundColor = [Colors.grey.shade600];
  Color _iconBGColor = Colors.grey.shade800;
  Color _iconColor = Colors.grey.shade400;
  Color _textColor = Colors.grey.shade400;
  Color _badgeBGColor = Colors.grey.shade400;
  Color _badgeTextColor = Colors.grey.shade800;
  Color _quoteImageColor = Colors.white;
  Color _backgroundColor = Colors.grey.shade600;

  List<Color> get quoteBackgroundColor => _quoteBackgroundColor;
  bool get check => _check;
  int get currentTheme => _currentTheme;
  Color get iconBGColor => _iconBGColor;
  Color get iconColor => _iconColor;
  Color get textColor => _textColor;
  Color get badgeBGColor => _badgeBGColor;
  Color get badgeTextColor => _badgeTextColor;
  Color get quoteImageColor => _quoteImageColor;
  Color get backgroundColor => _backgroundColor;

  void changeCheck(){
    _check = !_check;
    notifyListeners();
  }
  void changeCurrentTheme(int currentTheme){
    _currentTheme = currentTheme;
    notifyListeners();
  }
  changeThemeColors(){
    //light Theme
    if(currentTheme == 0){
      _backgroundColor = Colors.grey.shade200;
      _quoteImageColor = Colors.black;
      _quoteBackgroundColor = [Colors.black12];
      _iconBGColor = Colors.grey.shade600;
      _iconColor = Colors.white70;
      _textColor = Colors.grey.shade600;
      _badgeBGColor = _iconColor;
      _badgeTextColor = _iconBGColor;
    } // Dark Theme
    else if(currentTheme == 1){
      _backgroundColor = Colors.grey.shade600;
      _quoteImageColor = Colors.white;
      _quoteBackgroundColor = [Colors.grey.shade600];
      _iconBGColor = Colors.grey.shade800;
      _textColor = Colors.grey.shade400;
      _iconColor = _textColor;
      _badgeBGColor = _textColor;
      _badgeTextColor = _iconBGColor;
    } // Light Multiple Colors
    else if(currentTheme == 2){
      _backgroundColor = Colors.grey.shade200;
      _quoteImageColor = Colors.black;
      _quoteBackgroundColor = RandomColor().randomColors(count: 24,colorHue: ColorHue.random,colorBrightness: ColorBrightness.light);
      _iconBGColor = Colors.white.withOpacity(0.7);
      _iconColor = Colors.black.withOpacity(0.7);
      _textColor = Colors.black.withOpacity(0.7);
      _badgeBGColor = _iconColor;
      _badgeTextColor = _iconBGColor;
    } // dark Multiple Colors
    else{
      _backgroundColor = Colors.grey.shade600;
      _quoteImageColor = Colors.white;
      _quoteBackgroundColor = RandomColor().randomColors(count: 24,colorHue: ColorHue.random,colorBrightness: ColorBrightness.dark);
      _iconBGColor = Colors.black.withOpacity(0.5);
      _iconColor = Colors.white.withOpacity(0.7);
      _textColor = Colors.white.withOpacity(0.7);
      _badgeBGColor = _iconColor;
      _badgeTextColor = _iconBGColor;
    }
  }
}