import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:twitter/dashboard/custom_package.dart';
import '../login.dart';
import '../signup.dart';
import 'custom_package.dart';
import 'custom_submit.dart';
import 'head_title.dart';

class dashboard extends StatefulWidget {
  dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  void _navigateTologinScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => login()));
  }

  void _navigateTosignupScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => signup()));
  }

  List free_features = [
    '1 Auto Plug written',
    'Plug up to 3 times per month',
    'Set threshold fot minimum favourites or retweets',
    'Manual option,if user has responded to tweet do not autoplug',
  ];

  List standard_features = [
    'All features of free',
    'Option to write upto 3 auto plugs',
    'Plug upto 20 times per month',
  ];

  List pro_features = [
    'All features of free and standard',
    'Upto 12 different auto plugs that can be used',
    'Unlimited plugs per month',
    'Unlimited plugs per month % of tweets that meet threshold that you want auto plugged',
    'Maximum auto plugs per day (i.e. do not exceed 4 / day)',
  ];



  SignOut()async {
    if (userStatus = true) {
     await FirebaseAuth.instance.signOut();
      print('signout');
     var jeel =  FirebaseAuth.instance.currentUser?.email.toString();
     print(jeel);
     setState(() {
       userStatus = false;
     });

    }
    else {
      _dashboardState();
      print('user check from sign out function');
    }
  }

  bool userStatus = false;
  _dashboardState() {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        userStatus = true;
        print('userstatus became true');
      } else {
        userStatus = false;
        print('userstatus became false');
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.dashboard,
          color: Colors.green,
        ),
        backgroundColor: Colors.grey.shade200,
        title: Row(children: [
          Container(
            child: Text(
              'Dashboard ',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          Text(
            ' Pricing',
            style: TextStyle(color: Colors.black),
          ),
        ]),
        actions: [
          Row(
            children: [
              Container(
                child: userStatus
                    ? Row(
                        children: [
                          Text('Sign Out',
                              style: TextStyle(color: Colors.black)),
                          GestureDetector(
                            onTap: () => {
                              SignOut(),
                            },
                            child: Container(
                              color: Colors.grey,
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Text('Sign In',
                              style: TextStyle(color: Colors.black)),
                          GestureDetector(
                            onTap: () => {_navigateTologinScreen(context)},
                            child: Container(
                              color: Colors.grey,
                              child: Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              Container(
                width: 70,
                child: Icon(
                  Icons.picture_in_picture,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(
              height: 150,
              width: double.infinity,
              child: head(),
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 5,
                          child: package(
                            text: free_features,
                            title: 'Free',
                            price: '0',
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: start_trial(
                            strg: 'Start trial',
                            ontap: () => {_navigateTologinScreen(context)},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 5,
                          child: package(
                            text: standard_features,
                            title: 'Standard',
                            price: '8',
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: start_trial(
                            strg: 'Start trial',
                            ontap: () => {_navigateTologinScreen(context)},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Column(
                      children: [
                        Flexible(
                          flex: 5,
                          child: package(
                            text: pro_features,
                            title: 'Pro',
                            price: '12',
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: start_trial(
                            strg: 'Start trial',
                            ontap: () => {_navigateTologinScreen(context)},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
