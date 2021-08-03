import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
            child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:
                  BoxDecoration(color: Colors.teal, shape: BoxShape.circle),
            ),
            SizedBox(
              height: 10,
            ),
            Text("@Username")
          ],
        ))
      ],
    );
  }
}
