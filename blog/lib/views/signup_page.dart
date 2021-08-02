import 'package:blog/NetworkHandler/networkHandler.dart';
import 'package:blog/controller/authenticationController.dart';
import 'package:blog/views/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                              "SignUp With",
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
                            padding:
                                EdgeInsets.only(left: 20, top: 20, bottom: 10),
                            child: Text(
                              "Email",
                              style: TextStyle(fontSize: 16),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email Cannot be null";
                                } else {
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);
                                  if (!emailValid) {
                                    return "Enter Valid email";
                                  }
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
                                        Map<String, String> body = {
                                          "username": usernameController.text,
                                          "email": emailController.text,
                                          "password": passwordController.text
                                        };
                                        setState(() {
                                          circular = true;
                                        });
                                        Networkhandler()
                                            .post(body)
                                            .then((response) {
                                          if (response.statusCode == 200 ||
                                              response.statusCode == 201)
                                            print("registered");
                                          else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              duration: Duration(seconds: 2),
                                              content:
                                                  Text("Email already exist"),
                                            ));
                                            print("email already exist");
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
                                          "Create Account",
                                          style: TextStyle(
                                              letterSpacing: 1,
                                              fontSize: 20,
                                              fontFamily: "RobotoMono"),
                                        ))),
                              ),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // TextButton(
                              //   onPressed: () {},
                              //   child: Text(
                              //     "Forgot Password",
                              //   ),
                              // ),
                              Text(
                                "Already have an Account ? ",
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                      minimumSize: Size(50, 30),
                                      padding: EdgeInsets.all(0)),
                                  onPressed: () {
                                    Get.to(SigninPage());
                                  },
                                  child: Text(
                                    "Login",
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
