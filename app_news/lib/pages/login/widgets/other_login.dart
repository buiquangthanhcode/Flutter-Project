import 'package:flutter/material.dart';

class OtherLogin extends StatelessWidget {
  const OtherLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // google button
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: Image.asset(
            'assets/images/google.png',
            height: 30,
          ),
        ),

        SizedBox(width: 25),

        // facebook button
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200],
          ),
          child: Image.asset(
            'assets/images/facebook.png',
            height: 30,
          ),
        ),
      ],
    );
  }
}
