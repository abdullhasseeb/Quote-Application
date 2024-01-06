import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quoteapp/screens/login_screen.dart';
import 'package:quoteapp/widgets/primary_button.dart';

import '../widgets/reset_form.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200,),
            Text(
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
                'Please enter your email address',
                style: TextStyle(color: Colors.grey)
            ),
            SizedBox(height: 30,),
            ResetForm(),
            SizedBox(height: 40,),
            GestureDetector(
                child: PrimaryButton(buttonText: 'Reset Password'),
              onTap: () => Navigator.pushReplacement(context, PageTransition(child: LoginScreen(), type: PageTransitionType.fade)),
            ),
            SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
