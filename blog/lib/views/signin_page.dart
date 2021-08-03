import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:blog/NetworkHandler/networkHandler.dart';
import 'package:blog/controller/authenticationController.dart';
import 'package:blog/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Dashboard.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final storage = new FlutterSecureStorage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var authController = Get.put(AuthenticationController());
  final _key = GlobalKey<FormState>();
  bool circular = false;
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
                  child: Form(
                    key: _key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "SignIn With",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Color(0xff4169E1),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            padding:
                                EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text(
                              "Username",
                              style: TextStyle(fontSize: 16),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                              controller: usernameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Username cannot be empty";
                                } else if (value.length < 6) {
                                  return "Username must be minimum 5 character";
                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))))),
                        ),
                        Container(
                            margin:
                                EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text(
                              "Password",
                              style: TextStyle(fontSize: 16),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password Cannot be null";
                                } else if (value.length < 6) {
                                  return "Password must be 6 character";
                                }
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                  suffixIcon: Icon(Icons.visibility),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        circular
                            ? Center(child: CircularProgressIndicator())
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        Map<String, dynamic> body = {
                                          "username": usernameController.text,
                                          "password": passwordController.text
                                        };
                                        setState(() {
                                          circular = true;
                                        });
                                        Networkhandler()
                                            .login(body)
                                            .then((response) {
                                          if (response.statusCode == 200 ||
                                              response.statusCode == 201) {
                                            response =
                                                jsonDecode(response.body);
                                            storage.write(
                                                key: "token",
                                                value: response['token']);
                                            Get.to(Dashboard());
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content: Text(
                                                  "Email or password is incorrect"),
                                            ));
                                          }
                                          setState(() => {circular = false});
                                        });
                                        // print(body);
                                      }
                                    },
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
                                          "Login",
                                          style: TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 20,
                                              fontFamily: "RobotoMono"),
                                        ))),
                              ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "New User? ",
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size(50, 30),
                                      padding: EdgeInsets.all(0)),
                                  onPressed: () {
                                    Get.to(SignUpPage());
                                  },
                                  child: Text(
                                    "Signup",
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
