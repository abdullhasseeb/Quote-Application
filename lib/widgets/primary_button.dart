import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  String buttonText;
  PrimaryButton({
    super.key,
    required this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .08,
      decoration: BoxDecoration(
        color: Colors.grey.shade700,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
          buttonText,
        style: TextStyle(
          color: Colors.white
        )
      ),
    );
  }
}
