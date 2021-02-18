import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/home.dart';
import 'package:sample_project/register.dart';

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  bool eye;
  String Email;
  String Password;

  @override
  void initState() {
    // TODO: implement initState
    eye = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              child: Image.asset("assets/images/log.png"),
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 230, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(3, 5),
                        blurRadius: 6,
                        spreadRadius: -2),
                  ]),
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey[850]),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      cursorColor: Colors.blue,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: "Email",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      onChanged: (value) {
                        Email = value;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      obscureText: eye,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        suffixIcon: IconButton(
                          icon: Icon(
                              eye ? Icons.visibility : Icons.visibility_off),
                          color: Colors.black,
                          onPressed: () {
                            setState(() {
                              eye = !eye;
                            });
                          },
                        ),
                        border: UnderlineInputBorder(),
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      onChanged: (value) {
                        Password = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 500, left: 20),
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => register()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        'Create Account?',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: Email, password: Password)
                          .then((SignedInUser) {
                        Navigator.of(context).pop();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => home()));
                      }).catchError((e) {
                        print('Error Signing In');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            colors: [Colors.blue[300], Colors.blue[900]]),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
