import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/favourite_items.dart';
import 'package:quoteapp/providers/icons_provider.dart';
import 'package:quoteapp/screens/first_screen.dart';
import 'package:quoteapp/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> checkFirstScreen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checking =  prefs.getBool('first_screen') ?? false;
    return checking;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),() async {
      final favProvider = Provider.of<FavouriteProvider>(context,listen: false);
      final iconsProvider = Provider.of<IconsProvider>(context,listen: false);
      final screenHeight = MediaQuery.of(context).size.height;
      await favProvider.getFavFromHive();
      await iconsProvider.setFavIconSize(screenHeight * .04);
      await iconsProvider.setThemeIconSize(screenHeight * .04);
      await iconsProvider.setSettingsIconSize(screenHeight * .04);
      await iconsProvider.setUserIconSize(screenHeight * .04);
       (await checkFirstScreen() == true) ?
           Navigator.pushReplacement(context, PageTransition(child: HomeScreen(), type: PageTransitionType.fade))
            :
           Navigator.pushReplacement(context, PageTransition(child: FirstScreen(), type: PageTransitionType.fade));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.format_quote_outlined,size: 70,color: Colors.white,),
            Text('QUOTE APP',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}
