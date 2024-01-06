import 'package:flutter/material.dart';

class SocialLogins extends StatelessWidget {
  const SocialLogins({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BuildButton(
            image: Image(width:20,height:20,image: AssetImage('assets/images/facebook.png'),),
          textButton: 'Facebook',
        ),
        BuildButton(
            image: Image(width: 20,height:20,image: AssetImage('assets/images/google.png'),),
          textButton: 'Google',
        )
      ],
    );
  }
}
class BuildButton extends StatelessWidget {
  Image image;
  String textButton;
  BuildButton({
    required this.image,
    required this.textButton
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .06,
      width:  MediaQuery.of(context).size.width * .36,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(width: 5,),
          Text(textButton)
        ],
      ),
    );
  }
}

