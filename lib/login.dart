import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/dashboard/custom_submit.dart';
import 'package:twitter/dashboard/dashboardMain.dart';
import 'package:twitter/signup.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _emailfieldcont = TextEditingController();

  TextEditingController _passwordfieldcont = TextEditingController();

  void _NavigateToSignupScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => signup()));
  }

  var userStatus = FirebaseAuth.instance.currentUser;
  String errormessage = '';

  SignIn() async {
    if (userStatus != null) {
      print("user already logged in");
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => dashboard()));
    } else {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailfieldcont.text, password: _passwordfieldcont.text);
        print(FirebaseAuth.instance.currentUser?.uid.toString());
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => dashboard()));
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
          case "wrong-password":
            {
              setState(
                () {
                  errormessage = 'Your password is wrong.';
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
          case "user-not-found":
            {
              setState(
                () {
                  errormessage = 'User with this email doesn\'t exist.';
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
          case "user-disabled":
            {
              setState(
                () {
                  errormessage = 'User with this email has been disabled.';
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
          case "too-many-requests":
            {
              setState(
                () {
                  errormessage = 'Too many requests. Try again later.';
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
          case "operation-not-allowed":
            {
              setState(
                () {
                  errormessage =
                      'Signing in with Email and Password is not enabled.';
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
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
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
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailfieldcont,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // icons: Icons.send,
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
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordfieldcont,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    // icons: Icons.send,
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your password',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              start_trial(
                strg: 'Login',
                ontap: SignIn,
              ),
              Text(
                'OR',
                style: TextStyle(
                  color: Colors.blue.shade200,
                ),
              ),
              start_trial(
                strg: 'Sign Up',
                ontap: () => {
                  _NavigateToSignupScreen(context),
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
