import 'dart:ui';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.green.shade200],
                  begin: FractionalOffset(0.0, 1.0),
                  end: FractionalOffset(0.0, 1.0))),
          height: 782,
          child: Column(
            children: [
              Spacer(),
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "SignUp With Email",
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Text("Username")),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                      ),
                      Container(
                          padding:
                              EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Text("Email")),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                      ),
                      Container(
                          margin:
                              EdgeInsets.only(left: 20, top: 20, bottom: 10),
                          child: Text("Password")),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 20,
                                      fontFamily: "RobotoMono"),
                                ))),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
