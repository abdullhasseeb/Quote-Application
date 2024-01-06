import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quoteapp/screens/first_screen.dart';
import 'package:quoteapp/screens/home_screen.dart';
import 'package:quoteapp/screens/reset_screen.dart';
import 'package:quoteapp/screens/signup_screen.dart';
import 'package:quoteapp/widgets/social_logins.dart';

import '../widgets/login_form.dart';
import '../widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200,),
                Text(
                  'Welcome to Quote!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text('New to this app?',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, PageTransition(child: SignUpScreen(), type: PageTransitionType.leftToRight));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decorationThickness: 1,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                LoginForm(),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context, PageTransition(child: ResetScreen(), type: PageTransitionType.fade)),
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      decorationColor: Colors.grey,
                      decorationThickness: 1
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                    onTap: () => Navigator.pushReplacement(context, PageTransition(child: FirstScreen(), type: PageTransitionType.leftToRight)),
                    child: PrimaryButton(buttonText: 'Login In',)),
                SizedBox(height: 20,),
                Text('Or log in with:', style: TextStyle(),),
                SizedBox(height: 20,),
                SocialLogins(),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ));
  }
}
