import 'package:flutter/material.dart';
class head extends StatelessWidget {
  const head({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text('Plans that fit your need ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        Container(
          width: double.infinity,
          height: 30,
          child: Center(
            child: Text(
                'Start with free trial. No credit card needed. Cancel at any time.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                ),),
          ),
        ),
      ],
    );
  }
}
