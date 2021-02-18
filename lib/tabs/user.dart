import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class user extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<user> {
  var db = FirebaseDatabase.instance.reference();
  var datafromdatabase;
  String datastring;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.child("data").once().then((DataSnapshot data) async {
      datafromdatabase = data.value;
      datastring = datafromdatabase.toString();
      print(datafromdatabase);
      setState(() {
        datastring = datafromdatabase;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 120,
                  margin: EdgeInsets.only(right: 20),
                  width: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://static.scientificamerican.com/sciam/cache/file/ACF0A7DC-14E3-4263-93F438F6DA8CE98A_source.jpg?w=590&h=800&896FA922-DF63-4289-86E2E0A5A8D76BE1')),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: 200,
                        child: Text(
                          datafromdatabase == null ? 'Name' : datafromdatabase,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        decoration: BoxDecoration(),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        child: Text(
                          'Lorem Ipsum is simply',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                        decoration: BoxDecoration(),
                      ),
                      GestureDetector(
                        child: Container(
                          width: 200,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          child: Center(
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, right: 5, left: 5),
            child: Divider(
              height: 3,
              color: Colors.black54,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
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
