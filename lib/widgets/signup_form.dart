import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField( 'First Name', null,false),
        buildTextField( 'Last Name', null,false ),
        buildTextField(
             'Email',
            IconButton(
              icon: Icon(Icons.email_outlined),
              onPressed: (){},
            ),
            false
        ),
        buildTextField(
           'Phone',
           IconButton(
            icon: Icon(Icons.phone),
            onPressed: (){},
          ),
            false
        ),
        buildTextField(
          'Password',
          IconButton(
            icon: _isObscure ? Icon( Icons.visibility_off_outlined,color: Colors.grey,)
              :
            Icon(Icons.visibility_outlined),
            onPressed: (){
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          true
        ),
        buildTextField(
          'Confirm Password',
          IconButton(
            icon: Icon( _isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
            onPressed: (){
              setState(() {
                _isObscure = !_isObscure;
              });
            },
          ),
          true
        ),
      ],
    );
  }
  Widget buildTextField(String hint, IconButton? icon, bool pass){
    return TextFormField(
      obscureText: pass ? _isObscure : false,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: icon,
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
      ),
    );
  }
}


