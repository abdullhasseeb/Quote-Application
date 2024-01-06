import 'package:flutter/material.dart';

class ResetForm extends StatelessWidget {
  const ResetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2,color: Colors.black)
        )
      ),
    );
  }
}
