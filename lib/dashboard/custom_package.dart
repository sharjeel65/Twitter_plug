import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/dashboard/custom_feature.dart';

class package extends StatelessWidget {
  const package(
      {Key? key, required this.text, required this.title, required this.price})
      : super(key: key);
  final List text;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          height: 40,
          child: Center(
            child: Text(title),
          ),
        ),
        Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      '\$  ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      price,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      ' /month',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  feature(text: text[0]),
                  SizedBox(
                    height: 10,
                  ),
                  feature(text: text[1]),
                  SizedBox(
                    height: 10,
                  ),
                  feature(text: text[2]),
                  SizedBox(
                    height: 10,
                  ),
                  text.length > 3 ? feature(text: text[3]) : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  text.length > 4 ? feature(text: text[4]) : Container(),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
