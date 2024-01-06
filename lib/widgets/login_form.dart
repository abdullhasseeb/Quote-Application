import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTextField(
          'Email',
          IconButton(
              icon: Icon(Icons.email_outlined),
              onPressed:(){},
          ),
          false
        ),
        buildTextField(
            'Password',
            IconButton(
              icon: _isObscure  ? Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey
              )
                  : Icon(Icons.visibility_outlined,)
              ,
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          true
        )
      ],
    );
  }
  Widget buildTextField(String label, IconButton icon, bool pass){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        obscureText: pass ? _isObscure : false,
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
          suffixIcon: icon,
        ),
      ),
    );
  }
}
