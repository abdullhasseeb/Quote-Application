import 'package:flutter/material.dart';

class NoInternetWidget extends StatefulWidget {
  const NoInternetWidget({super.key});

  @override
  State<NoInternetWidget> createState() => _NoInternetWidgetState();
}

class _NoInternetWidgetState extends State<NoInternetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 10,),
        Image.asset(
          'assets/images/wifi.png',
          height: MediaQuery.of(context).size.width * 0.3,
          width: MediaQuery.of(context).size.width * 0.3,
          color: Colors.black,
        ),
        Spacer(flex: 1,),
        Text(
          'NO INTERNET',
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          'You are not connected to the Internet',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20,),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: (){},
            child: Text('Retry',style: TextStyle(color: Colors.white),),
          ),
        ),
        Spacer(flex: 10,)
      ],
    );
  }
}
