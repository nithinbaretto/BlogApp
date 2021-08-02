import 'dart:ui';

import 'package:blog/NetworkHandler/networkHandler.dart';
import 'package:blog/controller/authenticationController.dart';
import 'package:blog/views/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SignUpPage();
  }
}
