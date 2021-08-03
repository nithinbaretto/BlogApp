import 'package:blog/views/Dashboard.dart';
import 'package:blog/views/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = FlutterSecureStorage();
  Widget page = MainPage();
  @override
  void initState() {
    super.initState();
    update();
  }

  void update() async {
    var token = await storage.read(key: "token");
    print(token);
    if (token != null) {
      setState(() {
        page = Dashboard();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: page,
    );
  }
}
