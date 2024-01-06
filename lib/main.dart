import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:quoteapp/providers/favourite_items.dart';
import 'package:quoteapp/providers/icons_provider.dart';
import 'package:quoteapp/providers/theme_provider.dart';
import 'package:quoteapp/screens/first_screen.dart';
import 'package:quoteapp/screens/home_screen.dart';
import 'package:quoteapp/screens/login_screen.dart';
import 'package:quoteapp/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Hive No SQL Database
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => FavouriteProvider(),),
      ChangeNotifierProvider(create: (context) => IconsProvider(),),
      ChangeNotifierProvider(create: (context) => ThemeProvider(),)
    ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            useMaterial3: false,
            primarySwatch: Colors.grey,
              fontFamily: 'MainFonts',
              primaryColor: Colors.black,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black),
                      shape:MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                      textStyle: MaterialStatePropertyAll(
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MainFonts',
                          ))

                  )
              )
          ),
          home: SplashScreen()
      ),
    );
  }
  Future<bool> checkFirstScreen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checking =  prefs.getBool('first_screen') ?? false;
    return checking;
  }
}
