import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quoteapp/constants/get_data.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:random_color/random_color.dart';

class ThemeModel{
  final gradientColors;
  final name;
  final theme;
  final color;

  ThemeModel({
   required this.theme,
   required this.color,
   required this.gradientColors,
   required this.name
});

  Future<int> data ()async{
    int length = 0;
    String data = await rootBundle.loadString('assets/quotes.json');
    final jsonData = jsonDecode(data);
    for(Map i in jsonData){
      length++;
    }
    return length;
  }


  static List<ThemeModel> getData(){
    return [
     ThemeModel(theme: Brightness.light, color: [Colors.black12], gradientColors: [Colors.white70, Colors.white70], name: 'Light'),
     ThemeModel(theme: Brightness.dark, color: [Colors.grey.shade800], gradientColors: [Colors.grey.shade800, Colors.grey.shade800], name: 'Dark'),
     ThemeModel(theme: Brightness.light, color: RandomColor().randomColors(count: 24,colorHue: ColorHue.random,colorBrightness: ColorBrightness.light), gradientColors: [Colors.blue,Colors.cyanAccent,Colors.lightGreenAccent], name: 'Multi Light'),
     ThemeModel(theme: Brightness.dark, color: RandomColor().randomColors(count: 24,colorHue: ColorHue.random,colorBrightness: ColorBrightness.dark), gradientColors: [Colors.blueGrey,Colors.brown,Colors.deepPurple,], name: 'Multi Dark')
    ];
  }
}