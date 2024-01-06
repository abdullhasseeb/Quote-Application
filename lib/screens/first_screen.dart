import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quoteapp/screens/home_screen.dart';
import 'package:quoteapp/screens/login_screen.dart';
import 'package:quoteapp/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    double height = 40;
    double width = 40;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Spacer(),
            Image.asset("assets/images/quote.png",
                height: height, width: width, color: Colors.grey),
            SizedBox(
              height: 50,
            ),
            RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.grey,
                        fontFamily: 'MainFonts'),
                    children: [
                  TextSpan(text: 'Get\n'),
                  TextSpan(
                      text: 'Inspired',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ))
                ])),
            Spacer(),
            SizedBox(
                width: double.infinity,
                child: GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('first_screen', true);
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: HomeScreen(),
                              type: PageTransitionType.leftToRight));
                    },
                    child: PrimaryButton(buttonText: "Let's Go"))),
            Spacer()
          ]),
        ));
  }
}
