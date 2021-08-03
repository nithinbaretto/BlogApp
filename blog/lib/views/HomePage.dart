import 'package:blog/views/personal_details._add.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget page = AddPersonalDetails();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: page);
  }
}

class AddPersonalDetails extends StatelessWidget {
  const AddPersonalDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Expanded(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(UpdatePersonalDeails());
                    },
                    child: Container(
                        child: Text("Click here to add the personal details"))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
