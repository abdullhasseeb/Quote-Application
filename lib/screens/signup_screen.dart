import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quoteapp/screens/login_screen.dart';
import 'package:quoteapp/widgets/check_box.dart';
import 'package:quoteapp/widgets/social_logins.dart';

import '../widgets/primary_button.dart';
import '../widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70,),
              Text(
                'Create Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text('Already a member?',
                      style: TextStyle(color: Colors.grey)),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(child: LoginScreen(), type: PageTransitionType.rightToLeft));
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decorationThickness: 1,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              SignUpForm(),
              SizedBox(height: 20,),
              CheckBox(text: 'Agree to terms  and conditions. ',),
              SizedBox(height: 20,),
              PrimaryButton(buttonText: 'Sign Up',),
              SizedBox(height: 20,),
              Text(
                'Or login with:',
              ),
              SizedBox(height: 20,),
              SocialLogins(),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
