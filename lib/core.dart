import 'package:argus_sih/scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:toast/toast.dart';

import 'login.dart';

class Core extends StatefulWidget {
  @override
  _CoreState createState() => _CoreState();
}

class _CoreState extends State<Core> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Argus."),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.assignment_return),
              onPressed: () {
                signout();
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                color: Colors.blue,
                child: Text("Send"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanPage(true)));
                },
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text("Receive"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ScanPage(false)));
                },
              )
            ],
          ),
        ));
  }

  signout() async {
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    await googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    Toast.show("Logout Successful", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
