import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter/dashboard/custom_submit.dart';
import 'package:twitter/dashboard/dashboardMain.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  void _NavigatetSigninScreen(BuildContext context) {
    Navigator.of(context).pop(MaterialPageRoute(builder: (context) => login()));
  }

  void _NavigatetdashboardScreen(BuildContext context) {
    Navigator.of(context)
        .pop(MaterialPageRoute(builder: (context) => dashboard()));
  }

  String errormessage = '';

  SignUp() async {
    var userStatus = FirebaseAuth.instance.currentUser;
    print(userStatus);
    if (userStatus != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Text('Please Log Out First'),
            ),
          );
        },
      );
    } else {
      try {
        print('trying');
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailfieldcont.text, password: _passwordfieldcont.text);
        await FirebaseFirestore.instance.collection('Users').add({
          'email': _emailfieldcont.text,
          'displayname': _namefieldcont.text,
          'UID': FirebaseAuth.instance.currentUser?.uid.toString()
        });
        print('trying finished done');
      } on FirebaseAuthException catch (e) {
        print('Failed with error code: ${e.code}');
        print(e.message);
        switch (e.code) {
          case "invalid-email":
            {
              setState(
                () {
                  errormessage = 'Your email address appears to be malformed.';
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errormessage),
                    ),
                  );
                },
              );
            }
            break;
          case "weak-password":
            {
              setState(
                () {
                  errormessage =
                      'Weak Password. Password must be greater than 6 characters';
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errormessage),
                    ),
                  );
                },
              );
            }
            break;
          case "email-already-in-use":
            {
              setState(
                () {
                  errormessage =
                      'The email address is already in use by another account.';
                },
              );
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errormessage),
                    ),
                  );
                },
              );
            }
            break;
          default:
            {
              setState(
                () {
                  errormessage = "An undefined Error happened.";
                },
              );

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Container(
                      child: Text(errormessage),
                    ),
                  );
                },
              );
            }
        }
      }
      print('show dialog');
      setState(
        () {
          errormessage = 'Welcome, You are now registered';
        },
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              child: Text('Welcome, You are now registered'),
            ),
          );
        },
      );
      print('navigatetodashboardscreen');
      _NavigatetdashboardScreen(context);
    }
  }

  TextEditingController _namefieldcont = TextEditingController();

  TextEditingController _emailfieldcont = TextEditingController();

  TextEditingController _passwordfieldcont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
              width: 2,
              color: Colors.grey.shade200,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 500,
          height: 500,
          child: Column(
            children: [
              Container(
                child: Icon(
                  Icons.login_sharp,
                  size: 100,
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: _namefieldcont,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // icons: Icons.send,
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailfieldcont,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your email',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordfieldcont,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Password',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              start_trial(
                strg: 'Sign Up',
                ontap: () => {SignUp()},
              ),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.blue.shade200,
                ),
              ),
              start_trial(
                strg: 'Log In',
                ontap: () => {
                  _NavigatetSigninScreen(context),
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
