import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
class start_trial extends StatelessWidget {
  const start_trial({Key? key, this.ontap, required this.strg}) : super(key: key);
final ontap;
final String strg;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 30,
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white10,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(strg,
          style: TextStyle(color: Colors.blue.shade900),),
        ),
      ),
    );
  }
}
