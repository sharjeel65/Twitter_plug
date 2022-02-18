import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class feature extends StatelessWidget {
  const feature ( {Key? key, required this.text}) : super(key: key);
final String text;
  @override
  Widget build(BuildContext context) {
    return  Container(
     // color: Colors.red,
      margin: EdgeInsets.only(left: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          //  color: Colors.blue,
            child: Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: Colors.green,
              size: 15,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
